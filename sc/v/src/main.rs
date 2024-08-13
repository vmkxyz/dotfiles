use std::env;
use std::process::{Command, exit};

fn command_exists(cmd: &str) -> bool {
	Command::new("sh")
		.arg("-c")
		.arg(format!("command -v {}", cmd))
		.output()
		.map_or(false, |output| output.status.success())
}

fn main() {
	let user_id = users::get_current_uid();
	let mut fallback = None;

	// Set fallback editor
	if command_exists("vim") {
		fallback = Some("vim");
	} else if command_exists("vi") {
		fallback = Some("vi");
	} else if user_id == 0 {
		eprintln!("no editor available");
		exit(1);
	}

	// Root uses fallback, user uses $EDITOR if set or nvim if exists
	if user_id == 0 {
		if let Some(editor) = fallback {
			let _ = Command::new(editor).args(env::args().skip(1)).status();
		}
		exit(0);
	} else {
		if let Ok(editor) = env::var("EDITOR") {
			if !editor.is_empty() && command_exists(&editor) {
				let _ = Command::new(editor).args(env::args().skip(1)).status();
				exit(0);
			}
		}
		if let Some(editor) = fallback {
			let _ = Command::new(editor).args(env::args().skip(1)).status();
		}
	}
}
