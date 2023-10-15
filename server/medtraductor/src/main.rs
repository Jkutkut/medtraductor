use std::env;
use rocket::{Build, Rocket, launch, routes, catchers, get, tokio};
use rocket::serde::json::Json;

mod config;
// mod api;
mod api {
	use rocket::{get, routes, serde::json::Json, /*http::CookieJar,*/ State};
	use crate::config::route_error::InvalidAPI;
	use rocket::serde::{Deserialize, Serialize};
	use tokio_postgres::{Client, types::Type};
	use std::collections::HashMap;
	use uuid::Uuid;

	const DATETIME_FORMAT_ISO_8601: &str = "%Y-%m-%dT%H:%M:%S%.3fZ";

	pub fn get_v1_routes() -> Vec<rocket::Route> {
		#[cfg(debug_assertions)]
		return routes![
			dbquery
		];
		#[cfg(not(debug_assertions))]
		routes![
		]
	}

	#[derive(Debug, Deserialize)]
	#[serde(crate = "rocket::serde")]
	struct DBQuery {
		query: String,
	}

	type DBQueryRequest = Json<DBQuery>;
	#[derive(Debug, Serialize)]
	#[serde(untagged)]
	enum ResponseTypes {
		Str(String),
		Arr(Vec<ResponseTypes>),
		Int(i32),
		Obj(HashMap<String, ResponseTypes>),
	}
	type DBQueryResponse = Json<ResponseTypes>;

	#[get("/dbquery", format = "json", data = "<request>")]
	async fn dbquery(
		db: &State<Client>,
		// cookies: &CookieJar<'_>,
		request: DBQueryRequest,
	) -> Result<DBQueryResponse, InvalidAPI> {
		println!("request: {:?}", request);
		let mut size = 0;
		let mut result_arr = Vec::new();
		let stmt = db.prepare(&request.query).await.unwrap();
		for row in db.query(&stmt, &[]).await.unwrap() {
			let mut result_obj = HashMap::new();
			for col in row.columns() {
				let col_name = col.name();
				let col_value = match col.type_() {
					&Type::VARCHAR => ResponseTypes::Str(row.get::<_, String>(col_name)),
					&Type::UUID => ResponseTypes::Str(row.get::<_, Uuid>(col_name).to_string()),
					&Type::TIMESTAMP => {
						let datetime = chrono::TimeZone::from_utc_datetime(
							&chrono::offset::Utc,
							&row.get::<_, chrono::NaiveDateTime>(col_name)
						);
						let datetime = datetime.format(DATETIME_FORMAT_ISO_8601).to_string();
						ResponseTypes::Str(datetime)
					},
					_ => ResponseTypes::Str(format!("_INVALID_FIELD_{}", col_name)),
				};
				result_obj.insert(col_name.to_string(), col_value);
			}
			result_arr.push(ResponseTypes::Obj(result_obj));
			size += 1;
		}
		let mut result = HashMap::new();
		result.insert("size".to_string(), ResponseTypes::Int(size));
		result.insert(
			"data".to_string(),
			ResponseTypes::Arr(result_arr)
		);
		Ok(Json(ResponseTypes::Obj(result)))
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
