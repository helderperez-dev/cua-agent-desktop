#!/usr/bin/env bash
# Build a local DRIVER_IMAGE matching the GHCR layout (/out/reavion-driver).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${REAVION_DRIVER_SRC:-$ROOT/../reavion-driver}"
TAG="${DRIVER_IMAGE:-localhost/reavion-driver:local}"

if [ ! -f "$SRC/rust/Cargo.toml" ]; then
  echo "ERROR: reavion-driver not found at $SRC" >&2
  exit 1
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT
cp -a "$SRC/rust" "$tmpdir/rust"

cat > "$tmpdir/Dockerfile" <<'EOF'
ARG RUST_VERSION=1.97.1
FROM docker.io/library/rust:${RUST_VERSION}-bookworm AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
      pkg-config clang libclang-dev cmake \
      libx11-dev libxtst-dev libxfixes-dev libxi-dev libxrandr-dev \
      libxcomposite-dev libxdamage-dev libxext-dev libxkbcommon-dev \
      libdbus-1-dev libwayland-dev libpipewire-0.3-dev \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /src
COPY rust /src
RUN cargo build --locked --release -p reavion-driver \
 && install -D -m 0755 target/release/reavion-driver /out/reavion-driver
FROM busybox:1.36
COPY --from=builder /out/reavion-driver /out/reavion-driver
EOF

echo "Building ${TAG} from ${SRC}..."
docker build -t "$TAG" "$tmpdir"
echo "Built ${TAG}"
