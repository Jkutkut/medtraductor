use crate::model::uuid_wrapper::UuidWrapper;
use rocket::serde::json::Json;
use rocket::{get, State};
use tokio_postgres::{Client};
use crate::model::{Question, IdOrContent, IdOrUser};
use crate::config::route_error::InvalidAPI;
use chrono::NaiveDateTime;
use crate::utils::timestamp2str;

#[get("/question_detail/<uuid>")]
pub async fn question_detail(
	uuid: UuidWrapper,
	db: &State<Client>,
) -> Result<Json<Question>, InvalidAPI> {
	let uuid = match uuid.get() {
		Ok(u) => u,
		Err(e) => return Err(InvalidAPI::new(e))
	};
	let query_str = "SELECT * FROM question WHERE id = $1";
	let stmt = match db.prepare(query_str).await {
		Ok(stmt) => stmt,
		Err(e) => {
			return Err(InvalidAPI::new(e.to_string()));
		}
	};
	let query = match db.query(&stmt, &[&uuid]).await {
		Ok(query) => query,
		Err(e) => {
			return Err(InvalidAPI::new(
				format!("Error while executing query: {}", e)
			));
		}
	};
	if query.len() != 1 {
		return Err(InvalidAPI::new(
			format!("Expected 1 question, got {}", query.len())
		));
	}
	let query = &query[0];
	let question = Question {
		id: query.get("id"),
		title: query.get("title"),
		question_content: IdOrContent::Id(query.get("question_content_id")),
		author: IdOrUser::Id(query.get("author")),
		date: timestamp2str(&query.get::<_, NaiveDateTime>("date")),
		answers: None,
		tags: None
	};
	Ok(Json(question))
}
