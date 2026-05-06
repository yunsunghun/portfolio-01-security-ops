# Changelog

포트폴리오·교육용 저장소입니다. 버전은 **문서상**의 마일스톤입니다.

## [0.5.0] — 2026-05-07

### Added

- `examples/api-contract/openapi.yaml` — **DL-BFF** OpenAPI 3.0 더미 계약.

### Changed

- 포트폴리오 브리프에 **11번(취약점·패치)** 레포 링크 추가.

## [0.4.0] — 2026-05-04

### Added

- 모니터링 Lab: **Alertmanager**, `prometheus/alerts.yml`, Lab webhook sink.
- Prometheus: Blackbox·**Alertmanager·Blackbox exporter** `/metrics` 스크랩.
- Grafana: **스택 구성요소 UP** Stat 패널.
- `examples/monitoring-lab/scripts/smoke.sh` 스모크 스크립트.
- `README.en.md`, `docs/adr/ADR-0001-monitoring-lab-compose.md`.
- 취약점 주간 샘플, 분기 접근 리뷰 샘플.
- Dependabot(Docker).

### Changed

- Alertmanager: `severity=critical` / 기타 **라우트 분기**(동일 webhook — Lab).

## [0.3.0] — 2026-05-04

- 모니터링 Lab(Prometheus, Grafana, Blackbox) 최초 추가.

## [0.2.0] — 2026-05-04

- 가상 Lab·모의 관제·윤리적 모의 침해 문서, `DUMMY-CANON`, `sample-data`.

## [0.1.0] — 2026-05-04

- 초기 구조(문서, 데모 스택, 스크립트, IaC 샘플, 보안 템플릿).
