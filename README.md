# Campus Events Health Check Starter

A small Campus Events app and a health check script for you to complete.

## Start the app

```bash
docker compose up -d --build --wait
curl -i http://127.0.0.1:8093/health
```

## Your script

Complete the four TODOs in `scripts/healthscripts/healthcheck.sh`, then run:

```bash
bash scripts/healthscripts/healthcheck.sh
echo "exit=$?"
```

## Simulate a broken endpoint

```bash
EVENTS_MODE=broken docker compose up -d --wait
```

Return to normal with `docker compose up -d --wait`.

On Windows, run every command in Git Bash. The app uses practice data only.
