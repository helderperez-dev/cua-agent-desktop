//! Telemetry enable/disable switches shared with upstream Cua tooling names
//! (`CUA_TELEMETRY`, `$CUA_HOME/config.toml`) so existing opt-outs still apply.

use std::path::{Path, PathBuf};

/// Environment variable that forces telemetry on or off.
pub const ENV_TELEMETRY: &str = "CUA_TELEMETRY";

/// An environment lookup (process env, or a map in tests).
pub type Env<'a> = &'a dyn Fn(&str) -> Option<String>;

/// The process environment.
pub fn process_env(name: &str) -> Option<String> {
    std::env::var(name).ok()
}

/// `0/false/no/off` → false, `1/true/yes/on` → true.
pub fn parse_bool(value: &str) -> Option<bool> {
    match value.trim().to_ascii_lowercase().as_str() {
        "0" | "false" | "no" | "off" | "disable" | "disabled" => Some(false),
        "1" | "true" | "yes" | "on" | "enable" | "enabled" => Some(true),
        _ => None,
    }
}

/// Home directory for shared config: `$CUA_HOME`, else `~/.cua`.
pub fn cua_home(env: Env<'_>) -> Option<PathBuf> {
    if let Some(h) = env("CUA_HOME").filter(|h| !h.trim().is_empty()) {
        return Some(PathBuf::from(h));
    }
    env("HOME")
        .or_else(|| env("USERPROFILE"))
        .filter(|h| !h.trim().is_empty())
        .map(|h| PathBuf::from(h).join(".cua"))
}

/// `$CUA_HOME/config.toml`.
pub fn config_path(home: &Path) -> PathBuf {
    home.join("config.toml")
}

/// The `[telemetry] enabled` value in the config file, if set.
pub fn config_value(home: &Path) -> Option<bool> {
    let text = std::fs::read_to_string(config_path(home)).ok()?;
    let doc = text.parse::<toml_edit::DocumentMut>().ok()?;
    let v = doc.get("telemetry")?.get("enabled")?.as_value()?;
    match v {
        toml_edit::Value::Boolean(b) => Some(*b.value()),
        toml_edit::Value::String(s) => parse_bool(s.value()),
        toml_edit::Value::Integer(i) => Some(*i.value() != 0),
        _ => None,
    }
}
