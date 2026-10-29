#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

echo "Stopping cua-agent-desktop (workspace + Chrome profile kept)..."
compose down
echo "Stopped."
