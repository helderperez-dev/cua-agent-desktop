#!/bin/bash
set -euo pipefail

WEB_ROOT="${REAVION_VNC_ROOT:-/usr/share/reavion-vnc}"

while ! nc -z 127.0.0.1 "${VNC_PORT:-5901}"; do
  sleep 1
done

exec websockify \
  --web="${WEB_ROOT}" \
  "${NOVNC_PORT:-6901}" \
  "127.0.0.1:${VNC_PORT:-5901}"
