#!/usr/bin/env bash
# Launch Google Chrome with flags needed inside this hardened container.
set -euo pipefail

REAL="${CHROME_REAL:-/usr/bin/google-chrome-stable.real}"
if [ ! -x "$REAL" ]; then
  # Fallback if package layout differs
  for candidate in /opt/google/chrome/chrome /usr/bin/google-chrome-stable; do
    if [ -x "$candidate" ] && [ "$candidate" != "$(readlink -f "$0" 2>/dev/null || true)" ]; then
      REAL="$candidate"
      break
    fi
  done
fi

exec "$REAL" \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --no-first-run \
  --no-default-browser-check \
  --password-store=basic \
  "$@"
