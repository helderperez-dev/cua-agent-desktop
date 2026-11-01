#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

DESKTOP_BASE="${DESKTOP_BASE:-reavion/xfce:local}"
DRIVER_IMAGE="${DRIVER_IMAGE:-localhost/reavion-driver:local}"

# Ensure local driver OCI image exists when not pulling from GHCR.
if [[ "$DRIVER_IMAGE" == localhost/* ]] || [[ "$DRIVER_IMAGE" == reavion-driver:* ]]; then
  if ! docker image inspect "$DRIVER_IMAGE" >/dev/null 2>&1; then
    echo "Local DRIVER_IMAGE missing — building ${DRIVER_IMAGE}..."
    DRIVER_IMAGE="$DRIVER_IMAGE" "$ROOT_DIR/scripts/build-driver-image.sh"
  fi
fi

export DESKTOP_BASE DRIVER_IMAGE
echo "Building reavion-desktop (runtime=${RUNTIME}, base=${DESKTOP_BASE}, driver=${DRIVER_IMAGE})..."
compose build "$@"
echo "Build complete: localhost/reavion-desktop:local"
