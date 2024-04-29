import gleam/string

pub fn message(log_line: String) -> String {
  log_line
  |> string.split(": ")
  |> get_message
}

fn get_message(log_line_list: List(String)) {
  case log_line_list {
    [_, msg] -> string.trim(msg)
    _ -> "Invalid"
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    "[ERROR]: " <> _ -> "error"
    _ -> "Invalid"
  }
}

pub fn reformat(log_line: String) -> String {
  format_message(
    log_line
      |> message,
    log_line
      |> log_level,
  )
}

fn format_message(msg: String, level: String) -> String {
  msg <> " (" <> level <> ")"
}
