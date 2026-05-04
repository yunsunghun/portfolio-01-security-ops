#!/usr/bin/env sh
# 헬스 URL 점검 (서비스 운영 — 가용성)
set -eu

BASE_URL="${BASE_URL:-http://127.0.0.1:8080}"
URL="${BASE_URL%/}/health"

code=$(curl -sS -o /dev/null -w '%{http_code}' "$URL" || true)
if [ "$code" != "200" ]; then
  echo "healthcheck FAIL: HTTP $code ($URL)" >&2
  exit 1
fi

echo "healthcheck OK: HTTP $code ($URL)"
exit 0
