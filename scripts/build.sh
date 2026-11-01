#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

if [ ! -f "$ROOT_DIR/vendor/reavion-driver/rust/Cargo.toml" ]; then
  echo "vendor/reavion-driver missing — syncing from sibling checkout..."
  "$ROOT_DIR/scripts/sync-driver.sh"
fi

echo "Building cua-agent-desktop (runtime=${RUNTIME})..."
compose build "$@"
echo "Build complete: localhost/cua-agent-desktop:local"
