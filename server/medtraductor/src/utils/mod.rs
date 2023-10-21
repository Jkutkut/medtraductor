use chrono::NaiveDateTime;
use crate::constants::DATETIME_FORMAT_ISO_8601;

pub fn timestamp2str(
	timestamp: &NaiveDateTime
) -> String {
	let datetime = chrono::TimeZone::from_utc_datetime(
		&chrono::offset::Utc,
		timestamp
	);
	datetime.format(DATETIME_FORMAT_ISO_8601).to_string()
}
