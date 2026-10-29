#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

echo "Building cua-agent-desktop (runtime=${RUNTIME})..."
compose build "$@"
echo "Build complete: localhost/cua-agent-desktop:local"
