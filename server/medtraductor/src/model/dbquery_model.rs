use rocket::{serde::json::Json};
use rocket::serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(Debug, Deserialize)]
#[serde(crate = "rocket::serde")]
pub struct DBQuery {
	pub query: String,
}

pub type DBQueryRequest = Json<DBQuery>;

#[derive(Debug, Serialize)]
#[serde(untagged)]
pub enum ResponseTypes {
	Str(String),
	Arr(Vec<ResponseTypes>),
	Int(i32),
	Obj(HashMap<String, ResponseTypes>),
}

pub type DBQueryResponse = Json<ResponseTypes>;
