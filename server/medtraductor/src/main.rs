use std::env;
use rocket::{Build, Rocket, launch, routes, catchers, get, tokio};
use rocket::serde::json::Json;

mod config;
// mod api;
mod api {
	use rocket::{get, routes, serde::json::Json, http::CookieJar, State};
	use crate::config::route_error::InvalidAPI;
	use rocket::serde::{Deserialize, Serialize};
	use tokio_postgres::{Client};
	use std::collections::HashMap;
	use uuid::Uuid;

	pub fn get_v1_routes() -> Vec<rocket::Route> {
		routes![
			dbquery
		]
	}

	#[derive(Debug, Deserialize)]
	#[serde(crate = "rocket::serde")]
	struct DBQuery {
		query: String,
	}

	type DBQueryRequest = Json<DBQuery>;
	#[derive(Debug, Serialize)]
	enum ResponseTypes {
		Str(String),
		Arr(Vec<ResponseTypes>),
		Int(i32),
		Obj(HashMap<String, ResponseTypes>),
	}
	type DBQueryResponse = Json<HashMap<String, ResponseTypes>>;

	#[get("/dbquery", format = "json", data = "<request>")]
	async fn dbquery(
		db: &State<Client>,
		cookies: &CookieJar<'_>,
		request: DBQueryRequest,
	) -> Result<DBQueryResponse, InvalidAPI> {
		println!("request: {:?}", request);
		let mut size = 0;
		let mut result_arr = Vec::new();
		let stmt = db.prepare(&request.query).await.unwrap();
		for row in db.query(&stmt, &[]).await.unwrap() {
			let row_size = row.len();
			let mut vec = Vec::new();
			for i in 0..row_size {
				match row.try_get::<_, String>(i) {
					Ok(value) => vec.push(ResponseTypes::Str(value)),
					Err(e) => {
						eprintln!("Error while getting value from DB");
						eprintln!("{:?}", e);
					}
				}
			}
			result_arr.push(ResponseTypes::Arr(vec));
			size += 1;
		}
		let mut result: DBQueryResponse = Json(HashMap::new());
		result.0.insert("size".to_string(), ResponseTypes::Int(size));
		result.0.insert(
			"data".to_string(),
			ResponseTypes::Arr(result_arr)
		);
		Ok(result)
	}

}

pub const ENV: &'static str = "/installation/.env";

#[get("/ping")]
fn ping() -> Json<&'static str> {
	Json("pong")
}

#[launch]
async fn rocket() -> Rocket<Build> {
	dotenv::from_path(ENV).ok();
	// let args: Vec<String> = env::args().collect();
	// TODO handle args
	let port = 2000;
	let db_host = "172.17.0.3";
	let db_port = 5432;

	let db_properties = format!(
		"host={} port={} dbname={} user={} password={}",
		db_host, db_port,
		"postgres",
		env::var("DB_USR").unwrap(),
		env::var("DB_USR_PASSWD").unwrap(),
	);

	let (db_client, connection) = match tokio_postgres::connect(
		&db_properties,
		tokio_postgres::NoTls
	).await {
		Ok((client, connection)) => (client, connection),
		Err(e) => {
			eprintln!("Not able to connect with DB:\n{}", e);
			eprintln!("Is the DB running?");
			std::process::exit(1);
		}
	};

	tokio::spawn(async move {
		if let Err(e) = connection.await {
			eprintln!("connection error: {}", e);
			eprintln!("Stopping the server...");
			std::process::exit(1);
		}
	});

	rocket::custom(config::config::rocket_config(port))
		.attach(config::cors::CORS)
		.manage(db_client)
		.mount("/", routes![ping, config::cors::options])
		.mount("/api/v1", api::get_v1_routes())
		.register("/api", catchers![
			config::route_error::api_not_implemented,
			config::route_error::internal_server_error
		])
		// .mount("/", rocket::fs::FileServer::from(PUBLIC_DIR))
}
