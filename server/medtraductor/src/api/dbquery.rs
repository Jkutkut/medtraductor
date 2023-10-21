use rocket::{get, post, serde::json::Json, /*http::CookieJar,*/ State};
use crate::config::route_error::InvalidAPI;
use tokio_postgres::{Client, types::Type};
use std::collections::HashMap;
use uuid::Uuid;

use crate::model::dbquery_model::{DBQueryRequest, DBQueryResponse, ResponseTypes};
use crate::utils::timestamp2str;

#[post("/dbquery", format = "json", data = "<request>")]
pub async fn dbquery_js(
	db: &State<Client>,
	request: DBQueryRequest,
) -> Result<DBQueryResponse, InvalidAPI> {
	dbquery(db, request).await
}

#[get("/dbquery", format = "json", data = "<request>")]
pub async fn dbquery(
	db: &State<Client>,
	request: DBQueryRequest,
) -> Result<DBQueryResponse, InvalidAPI> {
	println!("request: {:?}", request);
	let mut size = 0;
	let mut result_arr = Vec::new();
	let stmt = match db.prepare(&request.query).await {
		Ok(stmt) => stmt,
		Err(e) => {
			return Err(InvalidAPI::new(e.to_string()));
		}
	};
	let query = match db.query(&stmt, &[]).await {
		Ok(query) => query,
		Err(e) => {
			return Err(InvalidAPI::new(
				format!("Error while executing query: {}", e)
			));
		}
	};
	for row in query {
		let mut result_obj = HashMap::new();
		for col in row.columns() {
			let col_name = col.name();
			let col_value = match col.type_() {
				&Type::VARCHAR => ResponseTypes::Str(row.get::<_, String>(col_name)),
				&Type::UUID => ResponseTypes::Str(row.get::<_, Uuid>(col_name).to_string()),
				&Type::TIMESTAMP => ResponseTypes::Str(timestamp2str(
					&row.get::<_, chrono::NaiveDateTime>(col_name)
				)),
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
