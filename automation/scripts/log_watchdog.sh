#!/usr/bin/env sh
# 최근 로그에서 패턴 검색 (보안관제 — 단순 시연)
set -eu

LOG_FILE="${LOG_FILE:-./var/log/app.log}"
PATTERN="${PATTERN:-ERROR}"

if [ ! -f "$LOG_FILE" ]; then
  echo "log_watchdog INFO: no file $LOG_FILE (create or set LOG_FILE)" >&2
  exit 0
fi

if tail -n 200 "$LOG_FILE" | grep -q "$PATTERN"; then
  echo "log_watchdog ALERT: pattern '$PATTERN' found in last 200 lines of $LOG_FILE" >&2
  exit 1
fi

echo "log_watchdog OK: no '$PATTERN' in tail of $LOG_FILE"
exit 0
