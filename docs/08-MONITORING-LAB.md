# 모니터링 Lab (Prometheus · Grafana · Blackbox)

## 목적

서버·서비스 **모니터링 포트폴리오**에서 흔히 요구하는 흐름을 한 번에 시연합니다.

1. **합성 모니터링(Blackbox)**: 사용자 관점 `/health` 가용성.
2. **메트릭 저장(Prometheus)**: 시계열 수집·쿼리.
3. **시각화(Grafana)**: 대시보드·(향후) 알림 연동 설명.

## 실행

[examples/monitoring-lab/README.md](../examples/monitoring-lab/README.md) 참고.

## 면접·문서에서 강조할 포인트

| 주제 | 이 Lab에서의 대응 |
|------|-------------------|
| SLI | `probe_success` (가용성), `probe_duration_seconds` (지연) |
| 알림 | Prometheus `rule_files` + Alertmanager로 확장 가능(02번 레포와 연계) |
| 보안 | Grafana 기본 계정은 **Lab 한정**, 외부 노출 금지 |

## 더미 규약

[docs/DUMMY-CANON.md](DUMMY-CANON.md) — `tenant=demolab`, `env=lab` 라벨을 Prometheus scrape에 사용합니다.
