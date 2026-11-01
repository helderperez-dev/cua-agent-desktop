#!/usr/bin/env bash
# Host MCP entrypoint: proxies stdio into the container's reavion-driver mcp.
set -euo pipefail

RUNTIME="${CUA_RUNTIME:-docker}"
CONTAINER="${CUA_CONTAINER:-${REAVION_CONTAINER:-reavion-desktop}}"
SOCKET="${REAVION_SOCKET:-${CUA_SOCKET:-/run/user/1000/reavion.sock}}"
DRIVER="${REAVION_DRIVER:-${CUA_DRIVER:-/usr/local/libexec/reavion-desktop/reavion-driver}}"

if ! command -v "$RUNTIME" >/dev/null 2>&1; then
  for _cand in \
    /usr/local/bin/docker /opt/homebrew/bin/docker /usr/bin/docker \
    /usr/local/bin/podman /opt/homebrew/bin/podman /usr/bin/podman; do
    if [ -x "$_cand" ]; then
      RUNTIME="$_cand"
      break
    fi
  done
fi

if ! command -v "$RUNTIME" >/dev/null 2>&1; then
  echo "ERROR: runtime '${RUNTIME}' not found on PATH." >&2
  exit 1
fi

if ! "$RUNTIME" inspect -f '{{.State.Running}}' "$CONTAINER" 2>/dev/null | grep -qx true; then
  echo "ERROR: container '${CONTAINER}' is not running." >&2
  echo "Start it with: ./scripts/up.sh" >&2
  exit 1
fi

if ! "$RUNTIME" exec -u reavion "$CONTAINER" test -S "$SOCKET" 2>/dev/null; then
  echo "ERROR: driver socket '${SOCKET}' not found in '${CONTAINER}'." >&2
  echo "Wait for the desktop to finish starting, or check: ./scripts/status.sh" >&2
  exit 1
fi

exec "$RUNTIME" exec -i \
  -u reavion \
  -e HOME=/home/reavion \
  -e DISPLAY=:1 \
  -e CUA_DRIVER_RS_TELEMETRY_ENABLED=0 \
  -e REAVION_DRIVER_RS_TELEMETRY_ENABLED=0 \
  "$CONTAINER" \
  "$DRIVER" mcp --socket "$SOCKET"
