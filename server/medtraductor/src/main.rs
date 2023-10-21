use std::env;
use rocket::{Build, Rocket, launch, routes, catchers, get, tokio};
use rocket::serde::json::Json;

mod constants;
mod model;
mod config;
mod api;
mod utils;

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
	let db_host = "172.17.0.2";
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
