# Changelog

포트폴리오·교육용 저장소입니다. 버전은 **문서상**의 마일스톤입니다.

## [0.8.2] — 2026-05-07

### Fixed

- `log_watchdog.sh` — `CDPATH= cd` 패턴 제거(**SC1007**). `CDPATH` 저장·비우고 `cd`/`pwd`로 절대 경로 계산.
- CI ShellCheck — `find … -exec shellcheck {} +`로 변경(xargs가 자식 **exit 1을 123으로** 바꾸는 혼동 방지).
- `actions/checkout@v4` → **`@v5`** (Node 20 deprecation 경고 완화).

## [0.8.1] — 2026-05-07

### Fixed

- `automation/scripts/*.sh`, `examples/monitoring-lab/scripts/smoke.sh` — 작업 트리 **CRLF → LF** 정리(Windows에서 편집 시 ShellCheck **SC1017** 등 방지).
- `.gitattributes` — `*.sh`에 `eol=lf` 고정.
- `healthcheck.sh` — `curl` 종료 코드를 **명시 처리**(ShellCheck **SC2312** 등 마스킹 경고 회피).
- `log_watchdog.sh` — `cd` 실패 시 종료(**SC2164**), `grep -Fq --`로 고정 문자열 매칭.
- CI ShellCheck 단계 — `find … | xargs shellcheck`로 파일 목록 명시.

## [0.8.0] — 2026-05-07

### Added

- **`.github/workflows/ci.yml`** — CI 단일 소스: Compose `config` 검증, 데모 스택 스모크(`/health` + 스크립트), 운영 스크립트 스모크, Ansible 구문·OpenAPI UTF-8 파싱, **pre-commit 설정 검증**, Dependabot **github-actions** 업데이트.
- **`.pre-commit-config.yaml`** — ShellCheck·기본 훅(선택).
- **`.gitleaks.toml`** — 샘플 접근 리뷰 표의 가상 키 이름 오탐 allowlist.

### Changed

- `docs/reference-github-actions-ci.yml` 제거(중복 방지). 문서·README 링크는 `.github/workflows/ci.yml`로 통일.
- Trivy CI는 **`scanners: vuln`** 으로 게이트(IaC 오탐 완화). Misconfig까지 게이트하려면 워크플로에서 `scanners` 줄을 제거하거나 `vuln,misconfig`로 확장.

## [0.7.0] — 2026-05-07

### Added

- CI에 **Gitleaks**, **Trivy fs** 잡 추가(당시 `docs/reference-github-actions-ci.yml` 참조 — 0.8.0에서 `.github/workflows/ci.yml`로 통합).
- `.trivyignore`(주석 예시), `docs/16-CI-SECURITY-SCANNING.md` 활성화 가이드.

## [0.6.0] — 2026-05-07

### Added

- 보안 담당관 관점 문서: 위험 등록부, 데이터 분류·보존, 접근 라이프사이클, ISO 27001 요지 매핑, 인식·피싱 지표(더미), 계정 탈취 침해 시나리오 (`docs/10`–`15`).

### Changed

- `docs/02-SECURITY-GOVERNANCE.md`에 상기 문서 링크 섹션 추가.

## [0.5.1] — 2026-05-07

### Added

- `docs/assets/grafana-dashboard-mockup.png` — 모니터링 대시보드 **AI 생성 목업**(실제 캡처 아님).
- `docs/assets/monitoring-lab-wireframe.svg` — 와이어프레임.
- `docs/ABOUT-ME-FILLED-SAMPLE.md` — **가상 인물** 예시 서사(이력서에 그대로 사용 금지 안내).

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
