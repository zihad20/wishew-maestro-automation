# Wishew Maestro Automation

Mobile/Web UI test automation using [Maestro](https://maestro.mobile.dev/).

## Setup

1. Install Maestro: `curl -Ls "https://get.maestro.mobile.dev" | bash`
2. Copy the env template: `cp .env.maestro.example .env.maestro`
3. Fill in your credentials in `.env.maestro`
4. Make scripts executable: `chmod +x scripts/*.sh`

## Run Tests

### Android
```bash
./scripts/run-android.sh auth/01-login.yaml
```

### iOS
```bash
./scripts/run-ios.sh auth/01-login.yaml
```

### Web
```bash
./scripts/run-web.sh search/20-search-query.yaml
```

### Smoke Regression (all smoke-tagged flows)
```bash
./scripts/run-android.sh --include-tags smoke .
```

### Maestro Studio (interactive)
```bash
maestro studio
```

## Architecture

```
run-android.sh / run-ios.sh / run-web.sh
        ↓  (sets MAESTRO_APP_ID + MAESTRO_BASE_LINK)
    run.sh
        ↓  (loads .env.maestro, calls maestro test)
    maestro test <flow.yaml>
        ↓
    shared/launch-and-login.yaml  (used by authenticated flows)
        ↓
    shared/perform-login.yaml
        ↓
    feature flow → assertions
```

## Framework Rules

- Use **testID selectors only** (`id:`) — never text selectors unless unavoidable
- Use **deep-link navigation** via `openLink: "${MAESTRO_BASE_LINK}..."`
- All credentials injected via `.env.maestro` — never hardcoded
- Avoid real payment/withdrawal submit actions
- Shared login flow must be invoked via `runFlow: ../shared/perform-login.yaml`

## Project Structure

```
maestro/
├── auth/           01-login, 02-signup-validation, 03-forgot-password
├── profile/        05-edit-name … 09-edit-location
├── wishes/         10-create-wish-category … 12-donate-open-drawer
├── community/      13-create-post … 16-report-post
├── settings/       17-shipping-address … 19-blocked-users
├── search/         20-search-query
├── messages/       21-search-conversations, 22-send-chat-message
├── wallet/         23-cashout-select-country, 24-cashout-amount-input
├── shared/         launch-and-login.yaml, perform-login.yaml
└── scripts/        run.sh, run-android.sh, run-ios.sh, run-web.sh
```
