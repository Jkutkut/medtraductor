use uuid::Uuid;
use serde::{Serialize, Deserialize};

pub mod dbquery_model;
pub mod uuid_wrapper;

pub type Timestamp = String;

#[derive(Serialize, Deserialize)]
pub struct User {
	pub id: Uuid,
	pub username: String,
	pub created: Timestamp
}

#[derive(Serialize, Deserialize)]
#[serde(untagged)]
pub enum IdOrUser {
	Id(Uuid),
	User(User)
}

#[derive(Serialize, Deserialize)]
pub struct Content {
	pub id: Uuid,
	pub author: IdOrUser,
	pub created: Timestamp,
	pub last_modified: Timestamp,
	pub good_content: bool,
	pub data: String
}

#[derive(Serialize, Deserialize)]
#[serde(untagged)]
pub enum IdOrContent {
	Id(Uuid),
	Content(Content)
}

#[derive(Serialize, Deserialize)]
pub struct Question {
	pub id: Uuid,
	pub title: String,
	pub question_content: IdOrContent,
	pub author: IdOrUser,
	pub date: Timestamp,
	pub answers: Option<Vec<Content>>,
	pub tags: Option<Vec<Tag>>
}

#[derive(Serialize, Deserialize)]
pub struct Tag {
	pub id: i32,
	pub name: String,
	pub description: String,
	pub related_tags: Option<Vec<Tag>>
}
