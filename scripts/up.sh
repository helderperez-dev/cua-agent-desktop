#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

mkdir -p -m 0700 "${ROOT_DIR}/workspace"
mkdir -p -m 0700 "${ROOT_DIR}/data/chrome-profile"

if [ -f "${ROOT_DIR}/.env" ]; then
  set -a
  # shellcheck disable=SC1091
  source "${ROOT_DIR}/.env"
  set +a
fi

echo "Starting reavion-desktop..."
compose up -d

echo "Waiting for Cua socket (${SOCKET})..."
deadline=$((SECONDS + 120))
ready=0
while (( SECONDS < deadline )); do
  # Run as cua: with cap_drop ALL, root lacks DAC_OVERRIDE on /run/user/1000.
  if container_running \
    && "$RUNTIME" exec -u reavion "$CONTAINER" test -S "$SOCKET" 2>/dev/null; then
    ready=1
    break
  fi
  sleep 2
done

if [ "$ready" -ne 1 ]; then
  echo "ERROR: Cua socket not ready within 120s." >&2
  echo "Check: ${RUNTIME} logs ${CONTAINER}" >&2
  echo "       ${RUNTIME} exec ${CONTAINER} supervisorctl status" >&2
  exit 1
fi

echo "Waiting for edge /health..."
health_ready=0
while (( SECONDS < deadline )); do
  if curl -fsS "http://127.0.0.1:6080/health" >/dev/null 2>&1; then
    health_ready=1
    break
  fi
  sleep 2
done

if [ "$health_ready" -ne 1 ]; then
  echo "WARNING: edge /health not ready yet (Caddy may still be starting)." >&2
fi

echo
echo "Desktop is ready."
echo "  Viewer:  http://127.0.0.1:6080/vnc.html"
echo "  Password: value of VNC_PW from .env (default: changeme)"
echo "  MCP HTTP: http://127.0.0.1:6080/mcp  (set MCP_API_KEY; or use scripts/mcp-bridge.sh for local stdio)"
echo
echo "Status: ./scripts/status.sh"
