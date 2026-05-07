#!/usr/bin/env sh
# 최근 로그에서 패턴 검색 (보안관제 — 단순 시연)
set -eu

# CDPATH가 설정된 셸에서 `cd ./dir`이 다른 경로로 튀는 것을 막음 (SC1007 회피: `VAR= cmd` 대신 블록)
saved_cdpath=${CDPATH-}
CDPATH=''
cd -- "$(dirname "$0")" || exit 1
SCRIPT_DIR=$(pwd)
cd -- "$SCRIPT_DIR/../.." || exit 1
REPO_ROOT=$(pwd)
CDPATH=$saved_cdpath
LOG_FILE="${LOG_FILE:-$REPO_ROOT/examples/sample-data/app.log}"
PATTERN="${PATTERN:-ERROR}"

if [ ! -f "$LOG_FILE" ]; then
  echo "log_watchdog INFO: no file $LOG_FILE (create or set LOG_FILE)" >&2
  exit 0
fi

if tail -n 200 "$LOG_FILE" | grep -Fq -- "$PATTERN"; then
  echo "log_watchdog ALERT: pattern '$PATTERN' found in last 200 lines of $LOG_FILE" >&2
  exit 1
fi

echo "log_watchdog OK: no '$PATTERN' in tail of $LOG_FILE"
exit 0
