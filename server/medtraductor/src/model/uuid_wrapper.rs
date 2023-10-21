use rocket::form::{FromFormField, ValueField};
use rocket::serde::Deserialize;
use rocket::request::FromParam;
use uuid::Uuid;

use crate::constants::ERROR_INVALID_UUID;

pub struct UuidWrapper(Result<Uuid, String>);

impl UuidWrapper {
	pub fn get(self) -> Result<Uuid, String> {
		self.0
	}

	pub fn new_invalid() -> Self {
		UuidWrapper(Err(ERROR_INVALID_UUID.to_string()))
	}
}

impl<'v> FromFormField<'v> for UuidWrapper {
	fn from_value(field: ValueField<'v>) -> rocket::form::Result<'v, Self> {
		Ok(match Uuid::parse_str(field.value) {
			Ok(uuid) => UuidWrapper(Ok(uuid)),
			Err(_) => UuidWrapper::new_invalid()
		})
	}
}

impl<'r> FromParam<'r> for UuidWrapper {
	type Error = &'r str;

	fn from_param(param: &'r str) -> Result<Self, Self::Error> {
		Ok(match Uuid::parse_str(param) {
			Ok(uuid) => UuidWrapper(Ok(uuid)),
			Err(_) => UuidWrapper::new_invalid()
		})
	}
}

impl<'de> Deserialize<'de> for UuidWrapper {
	fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
	where
		D: serde::Deserializer<'de>,
	{
		Ok(match Uuid::deserialize(deserializer) {
			Ok(uuid) => UuidWrapper(Ok(uuid)),
			Err(_) => UuidWrapper::new_invalid()
		})
	}
}

impl std::fmt::Debug for UuidWrapper {
	fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
		write!(f, "{:?}", self.0)
	}
}

impl std::fmt::Display for UuidWrapper {
	fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
		match &self.0 {
			Ok(uuid) => write!(f, "{}", uuid),
			Err(e) => write!(f, "{}", e)
		}
	}
}
