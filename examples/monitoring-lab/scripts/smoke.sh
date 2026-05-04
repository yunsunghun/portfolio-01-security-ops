#!/usr/bin/env sh
# 모니터링 Lab HTTP 스모크 (호스트에서 실행)
set -eu

PROM_URL="${PROM_URL:-http://127.0.0.1:9090}"
GRAFANA_URL="${GRAFANA_URL:-http://127.0.0.1:3000}"
ALERTMANAGER_URL="${ALERTMANAGER_URL:-http://127.0.0.1:9093}"

echo "smoke: Prometheus ready -> ${PROM_URL}/-/ready"
curl -sf "${PROM_URL}/-/ready" >/dev/null

echo "smoke: Alertmanager ready -> ${ALERTMANAGER_URL}/-/ready"
curl -sf "${ALERTMANAGER_URL}/-/ready" >/dev/null

echo "smoke: Grafana API health -> ${GRAFANA_URL}/api/health"
curl -sf "${GRAFANA_URL}/api/health" >/dev/null

echo "smoke: OK (Prometheus, Alertmanager, Grafana 응답 확인)"
