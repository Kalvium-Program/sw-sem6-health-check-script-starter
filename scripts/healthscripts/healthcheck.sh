#!/usr/bin/env bash
# Health check for the Campus Events app.
# Exit 0: every check passed. Exit 1: at least one check failed.

set -u

BASE_URL="${BASE_URL:-http://127.0.0.1:8093}"
failures=0

pass() { printf 'PASS  %s\n' "$1"; }
fail() {
  printf 'FAIL  %s\n' "$1" >&2
  failures=$((failures + 1))
}

# Check 1: the app's own tests
# TODO 1: Run the tests inside the app container:
#   docker compose exec -T app npm test --silent
# Hide its output. Call pass if it succeeds, or fail with a message if it does not.


# Checks 2 and 3: HTTP endpoints
check_endpoint() {
  local path="$1"
  local url="${BASE_URL}${path}"
  local status
  local curl_exit

  # TODO 2: Request "$url" with curl. Save only the HTTP status code in status.
  # Give up if there is no connection after 2 seconds, or no full answer after 5 seconds.
  # Save curl's exit code in curl_exit straight after the curl line.


  # TODO 3: Report one of three results:
  #   curl failed      -> fail "<path>: no response (curl exit <code>)"
  #   status not 200   -> fail "<path>: returned <status>, expected 200"
  #   status is 200    -> pass "<path>: returned 200"

}

check_endpoint /health
check_endpoint /api/events

# TODO 4: Print how many checks failed. Exit 1 if any failed, otherwise exit 0.
