use std::net::Ipv4Addr;
use rocket::Config;

pub fn rocket_config(
	port: u16
) -> rocket::Config {
	let base_config: Config;
	if cfg!(debug_assertions) {
		base_config = Config::debug_default();
	} else {
		base_config = Config::release_default();
	}
	rocket::Config {
		address: Ipv4Addr::new(0, 0, 0, 0).into(),
		port,
		..base_config
	}
}
