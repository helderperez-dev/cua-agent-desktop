#!/usr/bin/env bash
# Wait for XFCE/VNC DISPLAY=:1, then start reavion-driver serve on the same display.
set -euo pipefail

export HOME="${HOME:-/home/cua}"
export DISPLAY="${DISPLAY:-:1}"
export CUA_DRIVER_RS_TELEMETRY_ENABLED="${CUA_DRIVER_RS_TELEMETRY_ENABLED:-0}"
export REAVION_DRIVER_RS_TELEMETRY_ENABLED="${REAVION_DRIVER_RS_TELEMETRY_ENABLED:-0}"

SOCKET="${REAVION_SOCKET:-${CUA_SOCKET:-/run/user/1000/reavion.sock}}"
DRIVER="${REAVION_DRIVER:-${CUA_DRIVER:-/usr/local/libexec/reavion-desktop/reavion-driver}}"
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

rm -f "$SOCKET"

# existing-profile grant: agents can browser_prepare → attach to the logged-in
# Chrome window without a separate consent host.
exec "$DRIVER" serve \
  --socket "$SOCKET" \
  --permission-mode standard \
  --grant existing-profile
