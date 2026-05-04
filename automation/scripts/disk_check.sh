#!/usr/bin/env sh
# 루트 파티션 사용률 점검 (서버 운영)
set -eu

WARN="${DISK_WARN_PERCENT:-80}"
CRIT="${DISK_CRIT_PERCENT:-90}"

usage=$(df -P / 2>/dev/null | awk 'NR==2 {gsub(/%/,"",$5); print $5}')
if [ -z "${usage:-}" ]; then
  echo "disk_check SKIP: could not read df output" >&2
  exit 0
fi

if [ "$usage" -ge "$CRIT" ]; then
  echo "disk_check CRITICAL: / is ${usage}% (threshold ${CRIT}%)" >&2
  exit 2
fi

if [ "$usage" -ge "$WARN" ]; then
  echo "disk_check WARNING: / is ${usage}% (threshold ${WARN}%)" >&2
  exit 1
fi

echo "disk_check OK: / is ${usage}%"
exit 0
