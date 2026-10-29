#!/usr/bin/env bash
# Wait for XFCE/VNC DISPLAY=:1, then start cua-driver serve.
set -euo pipefail

export HOME="${HOME:-/home/cua}"
export DISPLAY="${DISPLAY:-:1}"
export CUA_DRIVER_RS_TELEMETRY_ENABLED="${CUA_DRIVER_RS_TELEMETRY_ENABLED:-0}"

SOCKET="${CUA_SOCKET:-/run/user/1000/cua.sock}"
DRIVER="${CUA_DRIVER:-/usr/local/libexec/cua-desktop/cua-driver}"
SOCKET_DIR="$(dirname "$SOCKET")"

mkdir -p "$SOCKET_DIR"

echo "Waiting for DISPLAY=${DISPLAY}..."
deadline=$((SECONDS + 60))
while (( SECONDS < deadline )); do
  if xset q >/dev/null 2>&1; then
    echo "DISPLAY=${DISPLAY} is ready"
    break
  fi
  sleep 1
done

if ! xset q >/dev/null 2>&1; then
  echo "ERROR: DISPLAY=${DISPLAY} not ready after 60s" >&2
  exit 1
fi

# Remove a stale socket left by a previous crash.
rm -f "$SOCKET"

exec "$DRIVER" serve \
  --socket "$SOCKET" \
  --permission-mode standard
