#!/usr/bin/env bash
# Shared helpers for lifecycle scripts.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

RUNTIME="${CUA_RUNTIME:-docker}"
CONTAINER="${CUA_CONTAINER:-cua-agent-desktop}"
SOCKET="${REAVION_SOCKET:-${CUA_SOCKET:-/run/user/1000/reavion.sock}}"
DRIVER="${REAVION_DRIVER:-${CUA_DRIVER:-/usr/local/libexec/reavion-desktop/reavion-driver}}"
COMPOSE_FILE="${ROOT_DIR}/docker-compose.yml"

compose() {
  if ! command -v "$RUNTIME" >/dev/null 2>&1; then
    echo "ERROR: runtime '${RUNTIME}' not found on PATH." >&2
    echo "Install Docker Desktop / Engine, or set CUA_RUNTIME=podman." >&2
    exit 1
  fi
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
