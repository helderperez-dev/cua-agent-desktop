#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

echo "=== cua-agent-desktop status ==="
echo "runtime:   ${RUNTIME}"
echo "container: ${CONTAINER}"

if container_running; then
  echo "running:   yes"
else
  echo "running:   no"
  if "$RUNTIME" inspect "$CONTAINER" >/dev/null 2>&1; then
    echo "state:     $($RUNTIME inspect -f '{{.State.Status}}' "$CONTAINER" 2>/dev/null || echo unknown)"
  else
    echo "state:     not created (run ./scripts/up.sh)"
  fi
  exit 1
fi

echo
echo "--- image labels ---"
"$RUNTIME" inspect -f '{{range $k,$v := .Config.Labels}}{{println $k "=" $v}}{{end}}' "$CONTAINER" \
  | grep -E 'cua\.agent\.desktop|org\.opencontainers\.image\.title' || true

echo
echo "--- edge (Caddy on container PORT → host 6080) ---"
ports="$("$RUNTIME" port "$CONTAINER" 8080 2>/dev/null || true)"
echo "publish:   ${ports:-none}"
if echo "${ports}" | grep -q '127.0.0.1:6080'; then
  echo "viewer:    http://127.0.0.1:6080/vnc.html"
  echo "mcp:       http://127.0.0.1:6080/mcp"
elif echo "${ports}" | grep -q '0.0.0.0'; then
  echo "WARNING: port appears bound on 0.0.0.0 (local compose should stay loopback)"
else
  echo "viewer:    (check docker-compose ports / Railway domain)"
fi
if curl -fsS "http://127.0.0.1:6080/health" >/dev/null 2>&1; then
  echo "health:    ok"
else
  echo "health:    not reachable"
fi

echo
echo "--- supervisor ---"
"$RUNTIME" exec "$CONTAINER" supervisorctl status 2>/dev/null || true

echo
echo "--- cua-driver ---"
if "$RUNTIME" exec -u cua "$CONTAINER" test -S "$SOCKET" 2>/dev/null; then
  echo "socket:    ${SOCKET} (ready)"
else
  echo "socket:    ${SOCKET} (MISSING)"
fi

if "$RUNTIME" exec -u cua -e HOME=/home/cua "$CONTAINER" "$DRIVER" --version 2>/dev/null; then
  :
else
  echo "driver:    could not run ${DRIVER} --version"
fi
