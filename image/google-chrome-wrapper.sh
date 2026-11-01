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

# Match the VNC framebuffer EXACTLY — agents click in native coordinates.
# Do not shrink for the panel; --start-maximized fills the usable work area.
IFS=x read -r _chrome_w _chrome_h <<EOF
${VNC_RESOLUTION:-1280x720}
EOF
_chrome_w="${_chrome_w:-1280}"
_chrome_h="${_chrome_h:-720}"

# --force-renderer-accessibility: required by cua-driver on Linux for exact
# browser bind + semantic snapshots (see cua.ai/docs/cua-driver/guides/browsers).
# --no-sandbox: needed under cap_drop ALL; banner is expected, not a bind blocker.
exec "$REAL" \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --no-first-run \
  --no-default-browser-check \
  --password-store=basic \
  --force-renderer-accessibility \
  --start-maximized \
  --window-size="${_chrome_w},${_chrome_h}" \
  --window-position=0,0 \
  --force-device-scale-factor=1 \
  --high-dpi-support=1 \
  "$@"
