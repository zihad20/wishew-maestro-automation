#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export MAESTRO_APP_ID="https://dev.app.wishew.com"
export MAESTRO_BASE_LINK="https://dev.app.wishew.com/"

maestro test "$@"