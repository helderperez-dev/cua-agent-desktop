//! Minimal telemetry config surface used by Reavion Driver.
//!
//! Upstream `libs/cua-driver` linked the monorepo `cua-telemetry` crate. This
//! stub keeps the same env/config opt-out switches so behavior stays compatible
//! without pulling PostHog / monorepo path deps.

pub mod config;
