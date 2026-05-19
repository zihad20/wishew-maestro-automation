#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

ENV_FILE="$PROJECT_DIR/.env.maestro"
if [[ -f "$ENV_FILE" ]]; then
  set -o allexport
  # shellcheck source=/dev/null
  source "$ENV_FILE"
  set +o allexport
fi

exec maestro test \
  --env MAESTRO_APP_ID="${MAESTRO_APP_ID:-}" \
  --env MAESTRO_BASE_LINK="${MAESTRO_BASE_LINK:-}" \
  --env TEST_EMAIL="${TEST_EMAIL:-}" \
  --env TEST_PASSWORD="${TEST_PASSWORD:-}" \
  --env CATEGORY_NAME="${CATEGORY_NAME:-}" \
  --env WISH_ID="${WISH_ID:-}" \
  --env POST_ID="${POST_ID:-}" \
  --env CHAT_ID="${CHAT_ID:-}" \
  "$@"
