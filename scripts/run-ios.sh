#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export MAESTRO_APP_ID="${MAESTRO_APP_ID:-com.wishew-dev.app}"
export MAESTRO_BASE_LINK="${MAESTRO_BASE_LINK:-wishew-dev://}"

exec "$SCRIPT_DIR/run.sh" "$@"
