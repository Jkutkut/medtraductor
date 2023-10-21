use rocket::{catch, Responder};
use rocket::serde::json::Json;

#[catch(501)]
pub fn api_not_implemented() -> Json<&'static str> {
	Json("Ups, this feature is not implemented yet.")
}

#[catch(500)]
pub fn internal_server_error() -> Json<&'static str> {
	Json("Well, this is embarrassing. Something went wrong on our side. Turns out, rust can fail too.")
}

#[derive(Responder)]
#[response(status = 409, content_type = "json")]
pub struct InvalidAPI {
	message: String
}

impl InvalidAPI {
	pub fn new_from_string(message: String) -> InvalidAPI {
		InvalidAPI { message }
	}

	pub fn new(message: &'static str) -> InvalidAPI {
		InvalidAPI::new_from_string(message.to_string())
	}
}
