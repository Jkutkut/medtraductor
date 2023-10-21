use rocket::{routes};

mod question_detail;
#[cfg(debug_assertions)]
mod dbquery;

use question_detail::{question_detail as question_detail_get};
#[cfg(debug_assertions)]
use dbquery::{dbquery as dbquery_post, dbquery_js};

pub fn get_v1_routes() -> Vec<rocket::Route> {
	let mut routes = routes![
		question_detail_get,
	];
	#[cfg(debug_assertions)]
	routes.append(&mut routes![
		dbquery_post,
		dbquery_js,
	]);
	routes
}
