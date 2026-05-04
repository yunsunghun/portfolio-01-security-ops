# 모니터링 Lab (Prometheus · Alertmanager · Grafana · Blackbox)

## 목적

1. **합성 모니터링(Blackbox)**: `/health` 가용성.
2. **메트릭·알림(Prometheus)**: `rule_files`로 SLI 위반 탐지.
3. **라우팅(Alertmanager)**: 심각도·그룹핑·**receiver** 개념 시연.
4. **시각화(Grafana)**.
5. **Lab webhook**: `alert_sink`가 실제 Slack 대신 200 응답만 반환(안전).

## 실행

[examples/monitoring-lab/README.md](../examples/monitoring-lab/README.md)

## 면접·문서에서 강조할 포인트

| 주제 | 이 Lab에서의 대응 |
|------|-------------------|
| SLI | `probe_success`, `probe_duration_seconds` |
| SLO/알림 | `prometheus/alerts.yml` → Alertmanager |
| 운영 안전 | 실제 발송 대신 **내부 http-echo**로 수신 확인 |

## 더미 규약

[DUMMY-CANON.md](DUMMY-CANON.md)
