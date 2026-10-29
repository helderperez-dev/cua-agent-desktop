#!/usr/bin/env bash
# Host MCP entrypoint: proxies stdio into the container's cua-driver mcp.
# Does not define tools — Cua Driver owns those.
set -euo pipefail

RUNTIME="${CUA_RUNTIME:-docker}"
CONTAINER="${CUA_CONTAINER:-cua-agent-desktop}"
SOCKET="${CUA_SOCKET:-/run/user/1000/cua.sock}"
DRIVER="${CUA_DRIVER:-/usr/local/libexec/cua-desktop/cua-driver}"

# GUI-launched MCP clients (Chatbox, Claude Desktop, ...) may not inherit the
# shell PATH, so fall back to well-known absolute runtime locations.
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

if ! "$RUNTIME" exec -u cua "$CONTAINER" test -S "$SOCKET" 2>/dev/null; then
  echo "ERROR: Cua socket '${SOCKET}' not found in '${CONTAINER}'." >&2
  echo "Wait for the desktop to finish starting, or check: ./scripts/status.sh" >&2
  exit 1
fi

exec "$RUNTIME" exec -i \
  -u cua \
  -e HOME=/home/cua \
  -e DISPLAY=:1 \
  -e CUA_DRIVER_RS_TELEMETRY_ENABLED=0 \
  "$CONTAINER" \
  "$DRIVER" mcp --socket "$SOCKET"
