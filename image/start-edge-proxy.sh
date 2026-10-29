#!/usr/bin/env bash
# Public edge (Caddy): noVNC + MCP on a single $PORT for Railway / remote access.
set -euo pipefail

export PORT="${PORT:-8080}"

echo "Waiting for noVNC on :6901..."
deadline=$((SECONDS + 120))
while (( SECONDS < deadline )); do
  if (echo >/dev/tcp/127.0.0.1/6901) >/dev/null 2>&1; then
    echo "noVNC is accepting connections"
    break
  fi
  sleep 1
done

echo "Starting Caddy on :${PORT}"
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
