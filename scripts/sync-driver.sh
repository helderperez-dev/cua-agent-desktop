#!/usr/bin/env bash
# Sync ../reavion-driver/rust into vendor/ for Docker builds (Railway-self-contained).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REAVION_DRIVER_SRC:-$ROOT/../reavion-driver}"
DEST="$ROOT/vendor/reavion-driver"

if [ ! -d "$SRC/rust" ]; then
  echo "ERROR: driver source not found at $SRC/rust" >&2
  echo "Set REAVION_DRIVER_SRC or clone reavion-driver next to this repo." >&2
  exit 1
fi

mkdir -p "$DEST"
rsync -a --delete \
  --exclude 'target/' \
  --exclude '**/target/' \
  --exclude '.git/' \
  --exclude 'node_modules/' \
  --exclude '**/.DS_Store' \
  "$SRC/rust/" "$DEST/rust/"

for f in .cua-source-commit NOTICE LICENSE LICENSE.md; do
  if [ -f "$SRC/$f" ]; then
    cp "$SRC/$f" "$DEST/$f"
  fi
done

echo "Synced $SRC → $DEST ($(du -sh "$DEST" | awk '{print $1}'))"
