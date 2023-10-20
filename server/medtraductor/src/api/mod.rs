use rocket::{routes};

#[cfg(debug_assertions)]
mod dbquery;

#[cfg(debug_assertions)]
use dbquery::{dbquery as dbquery_post, dbquery_js};

pub fn get_v1_routes() -> Vec<rocket::Route> {
	let mut routes = routes![];
	#[cfg(debug_assertions)]
	routes.append(&mut routes![
		dbquery_post,
		dbquery_js,
	]);
	routes
}
