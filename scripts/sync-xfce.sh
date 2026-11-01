#!/usr/bin/env bash
# Sync ../reavion-images/images/xfce into vendor/ for offline seat builds.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REAVION_IMAGES_SRC:-$ROOT/../reavion-images}/images/xfce"
DEST="$ROOT/vendor/reavion-xfce"
if [ ! -f "$SRC/Dockerfile" ]; then
  echo "ERROR: xfce image context not found at $SRC" >&2
  exit 1
fi
mkdir -p "$DEST"
rsync -a --delete --exclude '.git/' "$SRC/" "$DEST/"
echo "Synced $SRC → $DEST ($(du -sh "$DEST" | awk '{print $1}'))"
