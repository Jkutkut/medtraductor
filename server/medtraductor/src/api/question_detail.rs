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
	let query = match sql_get_single(query_str, &[&uuid], db).await {
		Ok(query) => query,
		Err(e) => return Err(e)
	};
	let query = &query[0];
	let question_content = match get_content_by_id(
		query.get("question_content_id"),
		db
	).await {
		Ok(content) => IdOrContent::Content(content.into_inner()),
		Err(_) => IdOrContent::Id(query.get("question_content_id"))
	};
	let author = match get_user_by_id(
		query.get("author"),
		db
	).await {
		Ok(user) => IdOrUser::User(user.into_inner()),
		Err(_) => IdOrUser::Id(query.get("author"))
	};
	let question = Question {
		id: query.get("id"),
		title: query.get("title"),
		question_content,
		author,
		date: timestamp2str(&query.get::<_, NaiveDateTime>("date")),
		answers: match get_question_answers(uuid, db).await {
			Ok(answers) => Some(answers),
			Err(_) => None
		},
		tags: match get_question_tags(uuid, db).await {
			Ok(tags) => Some(tags),
			Err(_) => None
		}
	};
	Ok(Json(question))
}

use crate::model::Content;
use uuid::Uuid;

async fn get_content_by_id(
	uuid: Uuid,
	db: &State<Client>,
) -> Result<Json<Content>, InvalidAPI> {
	let query_str = "SELECT * FROM content WHERE id = $1";
	let query = match sql_get_single(query_str, &[&uuid], db).await {
		Ok(query) => query,
		Err(e) => return Err(e)
	};
	let query = &query[0];
	let author = match get_user_by_id(
		query.get("author"),
		db
	).await {
		Ok(user) => IdOrUser::User(user.into_inner()),
		Err(_) => IdOrUser::Id(query.get("author"))
	};
	let content = Content {
		id: query.get("id"),
		author,
		created: timestamp2str(&query.get::<_, NaiveDateTime>("created")),
		last_modified: timestamp2str(&query.get::<_, NaiveDateTime>("last_modified")),
		good_content: query.get("good_content"),
		data: query.get("data")
	};
	Ok(Json(content))
}

use crate::model::User;
async fn get_user_by_id(
	uuid: Uuid,
	db: &State<Client>,
) -> Result<Json<User>, InvalidAPI> {
	let query_str = "SELECT * FROM meduser WHERE id = $1";
	let query = match sql_get_single(query_str, &[&uuid], db).await {
		Ok(query) => query,
		Err(e) => return Err(e)
	};
	let query = &query[0];
	Ok(Json(User {
		id: query.get("id"),
		username: query.get("username"),
		created: timestamp2str(&query.get::<_, NaiveDateTime>("created"))
	}))
}

use crate::model::Tag;
async fn get_question_tags(
	question_uuid: Uuid,
	db: &State<Client>,
) -> Result<Vec<Tag>, InvalidAPI> {
	let query_str = "SELECT t.* FROM tag t, question_tag qt WHERE qt.question_id = $1 AND qt.tag_id = t.id";
	let query = match sql_get(query_str, &[&question_uuid], db).await {
		Ok(query) => query,
		Err(e) => return Err(e)
	};
	let mut tags = Vec::new();
	for row in query {
		tags.push(Tag {
			id: row.get("id"),
			name: row.get("name"),
			description: row.get("description"),
			related_tags: None
		});
	}
	Ok(tags)
}

async fn get_question_answers(
	question_uuid: Uuid,
	db: &State<Client>,
) -> Result<Vec<Content>, InvalidAPI> {
	let query_str = "SELECT c.* FROM content c, answer a WHERE a.question_id = $1 and a.content_id = c.id";
	let query = match sql_get(query_str, &[&question_uuid], db).await {
		Ok(query) => query,
		Err(e) => return Err(e)
	};
	let mut answers = Vec::new();
	for row in query {
		let author = match get_user_by_id(
			row.get("author"),
			db
		).await {
			Ok(user) => IdOrUser::User(user.into_inner()),
			Err(_) => IdOrUser::Id(row.get("author"))
		};
		answers.push(Content {
			id: row.get("id"),
			author,
			created: timestamp2str(&row.get::<_, NaiveDateTime>("created")),
			last_modified: timestamp2str(&row.get::<_, NaiveDateTime>("last_modified")),
			good_content: row.get("good_content"),
			data: row.get("data")
		});
	}
	Ok(answers)
}

use tokio_postgres::{types::ToSql, Row};

async fn sql_get<'a>(
	query_str: &'a str,
	params: &'a [&'a (dyn ToSql + Sync)],
	db: &'a State<Client>,
) -> Result<Vec<Row>, InvalidAPI> {
	let stmt = match db.prepare(query_str).await {
		Ok(stmt) => stmt,
		Err(e) => {
			return Err(InvalidAPI::new(e.to_string()));
		}
	};
	let query = db.query(&stmt, params).await;
	if let Err(e) = query {
		return Err(InvalidAPI::new(
			format!("Error while executing query: {}", e)
		));
	}
	Ok(query.unwrap())
}

async fn sql_get_single<'a>(
	query_str: &'a str,
	params: &'a [&'a (dyn ToSql + Sync)],
	db: &'a State<Client>,
) -> Result<Vec<Row>, InvalidAPI> {
	let query = match sql_get(query_str, params, db).await {
		Ok(query) => query,
		Err(e) => return Err(e)
	};
	if query.len() != 1 {
		return Err(InvalidAPI::new(
			format!("Expected 1 user, got {}", query.len())
		));
	}
	Ok(query)
}
