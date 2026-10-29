#!/usr/bin/env bash
# Shared helpers for lifecycle scripts.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

RUNTIME="${CUA_RUNTIME:-docker}"
CONTAINER="${CUA_CONTAINER:-cua-agent-desktop}"
SOCKET="${CUA_SOCKET:-/run/user/1000/cua.sock}"
DRIVER="${CUA_DRIVER:-/usr/local/libexec/cua-desktop/cua-driver}"
COMPOSE_FILE="${ROOT_DIR}/docker-compose.yml"

compose() {
  if ! command -v "$RUNTIME" >/dev/null 2>&1; then
    echo "ERROR: runtime '${RUNTIME}' not found on PATH." >&2
    echo "Install Docker Desktop / Engine, or set CUA_RUNTIME=podman." >&2
    exit 1
  fi
  # Docker Compose v2 plugin or podman compose
  if "$RUNTIME" compose version >/dev/null 2>&1; then
    "$RUNTIME" compose -f "$COMPOSE_FILE" "$@"
  elif command -v docker-compose >/dev/null 2>&1 && [ "$RUNTIME" = docker ]; then
    docker-compose -f "$COMPOSE_FILE" "$@"
  else
    echo "ERROR: '${RUNTIME} compose' is not available." >&2
    exit 1
  fi
}

container_running() {
  "$RUNTIME" inspect -f '{{.State.Running}}' "$CONTAINER" 2>/dev/null | grep -qx true
}
