#!/usr/bin/env bash
# Wait for XFCE/VNC DISPLAY=:1, then start reavion-driver serve on the same display.
set -euo pipefail

export HOME="${HOME:-/home/reavion}"
export USER="${USER:-reavion}"
export DISPLAY="${DISPLAY:-:1}"
export XAUTHORITY="${XAUTHORITY:-${HOME}/.Xauthority}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/1000/bus}"
export CUA_DRIVER_RS_TELEMETRY_ENABLED="${CUA_DRIVER_RS_TELEMETRY_ENABLED:-0}"
export REAVION_DRIVER_RS_TELEMETRY_ENABLED="${REAVION_DRIVER_RS_TELEMETRY_ENABLED:-0}"

SOCKET="${REAVION_SOCKET:-${CUA_SOCKET:-/run/user/1000/reavion.sock}}"
DRIVER="${REAVION_DRIVER:-${CUA_DRIVER:-/usr/local/libexec/reavion-desktop/reavion-driver}}"
SOCKET_DIR="$(dirname "$SOCKET")"

mkdir -p "$SOCKET_DIR"

if [ ! -x "$DRIVER" ]; then
  echo "ERROR: driver binary missing or not executable: ${DRIVER}" >&2
  ls -la "$(dirname "$DRIVER")" >&2 || true
  exit 1
fi

echo "Waiting for DISPLAY=${DISPLAY} (driver=$(basename "$DRIVER"))..."
deadline=$((SECONDS + 120))
while (( SECONDS < deadline )); do
  if xset q >/dev/null 2>&1; then
    echo "DISPLAY=${DISPLAY} is ready"
    break
  fi
  sleep 1
done

if ! xset q >/dev/null 2>&1; then
  echo "ERROR: DISPLAY=${DISPLAY} not ready after 120s" >&2
  exit 1
fi

# Brief settle so XFCE/AT-SPI session buses are up before serve.
sleep 2

# Prefer attaching after system D-Bus is up (Chrome will not stay alive without it).
for _ in $(seq 1 50); do
  if [ -S /run/dbus/system_bus_socket ] || [ -S /var/run/dbus/system_bus_socket ]; then
    break
  fi
  sleep 0.1
done

rm -f "$SOCKET"

echo "Starting ${DRIVER} serve --socket ${SOCKET}"
# existing-profile grant: agents can browser_prepare → attach to the logged-in
# Chrome window without a separate consent host.
exec "$DRIVER" serve \
  --socket "$SOCKET" \
  --permission-mode standard \
  --grant existing-profile
