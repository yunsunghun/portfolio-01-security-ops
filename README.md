# 포트폴리오 01 — 보안관제 · 서비스 · 서버 운영

클라우드 계정 없이도 **문서·코드·CI**로 운영 역량을 설명할 수 있게 구성한 저장소입니다.  
**데모랩(DemoLab)** 가상 조직·티켓·IP는 [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md)와 `examples/sample-data/`에 정리되어 있습니다.  
인사 담당자는 *역할과 성과를 말로 확장할 수 있는 뼈대*를, 엔지니어는 *실행·검증 가능한 아티팩트*를 빠르게 확인할 수 있습니다.

## English (summary)

**DemoLab (fictional)** operations portfolio: runbooks, security governance templates, **Docker demos**, **Terraform/Ansible samples**, a **Monitoring Lab** (Prometheus, **Alertmanager**, Grafana, Blackbox), and **GitHub Actions CI** ([`.github/workflows/ci.yml`](.github/workflows/ci.yml)). All IPs/tickets are **dummy** — see [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md). For your own narrative, use [docs/ABOUT-ME-TEMPLATE.md](docs/ABOUT-ME-TEMPLATE.md). Full English readme: [README.en.md](README.en.md) · [CHANGELOG.md](CHANGELOG.md).

## 한 줄 요약

**가용성 점검, 서버 기준선, 보안 거버넌스 문서, 인시던트 런북**을 한 레포에 묶고, **Docker 데모 + Terraform/Ansible 샘플 + GitHub Actions CI([`.github/workflows/ci.yml`](.github/workflows/ci.yml))**로 재현성을 보여 줍니다.

## 이 저장소로 보여 주고 싶은 역량

| 영역 | 내용 |
|------|------|
| 서비스 운영 | 헬스체크, 배포 체크리스트, 롤백 판단 프레임 |
| 서버 운영 | 디스크·로그 점검 스크립트, Ansible 기준선 예시 |
| 보안 관제 | 기준선 체크리스트, CVE 대응 템플릿, CI 정적 분석, **가상 Lab·모의 관제·윤리적 모의 침해 문서** |

## 빠른 시작 (15분 이내)

1. **데모 서비스** (Docker)

   ```bash
   cd examples/demo-stack
   docker compose up -d
   curl -sf http://localhost:8080/health
   ```

2. **운영 스크립트**

   ```bash
   chmod +x automation/scripts/*.sh
   ./automation/scripts/healthcheck.sh
   ./automation/scripts/disk_check.sh
   ./automation/scripts/log_watchdog.sh
   ```

   `log_watchdog.sh`는 기본으로 `examples/sample-data/app.log`(더미 BFF 로그)를 검사합니다.

3. **Terraform (클라우드 자원 없음)**

   ```bash
   cd infra/terraform
   terraform init
   terraform apply -auto-approve
   ```

   로컬에 Terraform이 없어도, 푸시 후 GitHub Actions에서 `fmt`·`validate`가 실행됩니다.

4. **모니터링 Lab (Prometheus · Grafana · Blackbox)**

   ```bash
   cd examples/monitoring-lab
   docker compose up -d
   ```

   - Grafana: http://localhost:3000 (`demolab` / `demolab-grafana`)
   - Prometheus: http://localhost:9090
   - Alertmanager: http://localhost:9093

   상세: [examples/monitoring-lab/README.md](examples/monitoring-lab/README.md)

   스택 기동 후(선택): `sh examples/monitoring-lab/scripts/smoke.sh`

환경 변수 예시는 [`.env.example`](.env.example)를 참고하세요.

## 문서 맵 (기획 → 운영)

| 문서 | 용도 |
|------|------|
| [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md) | 가상 조직·IP·티켓 ID 규약 (전체 더미의 기준) |
| [docs/00-PORTFOLIO-BRIEF.md](docs/00-PORTFOLIO-BRIEF.md) | 기획·범위·성공 지표·02/03 분리 제안 |
| [docs/01-ARCHITECTURE.md](docs/01-ARCHITECTURE.md) | 논리 아키텍처·확장 메모 |
| [docs/02-SECURITY-GOVERNANCE.md](docs/02-SECURITY-GOVERNANCE.md) | 보안·관제 거버넌스 |
| [docs/03-RUNBOOKS.md](docs/03-RUNBOOKS.md) | 장애·관제 런북 + 시뮬레이션 과제 |
| [docs/04-DEPLOYMENT-CHECKLIST.md](docs/04-DEPLOYMENT-CHECKLIST.md) | 릴리즈·롤백 체크리스트 |
| [docs/05-LAB-VIRTUAL-ENVIRONMENT.md](docs/05-LAB-VIRTUAL-ENVIRONMENT.md) | 가상 Lab 토폴로지·세그먼트(예시) |
| [docs/06-MOCK-SOC-EXERCISE.md](docs/06-MOCK-SOC-EXERCISE.md) | 모의 관제 시나리오·타임라인 표 |
| [docs/07-ETHICAL-RED-TEAM-LAB-NOTES.md](docs/07-ETHICAL-RED-TEAM-LAB-NOTES.md) | 윤리적 모의 침해(Lab 한정) ROE·보고 템플릿 |
| [docs/08-MONITORING-LAB.md](docs/08-MONITORING-LAB.md) | Prometheus·Alertmanager·Grafana·Blackbox Lab 설명 |
| [docs/09-TABLETOP-SESSION-AGENDA.md](docs/09-TABLETOP-SESSION-AGENDA.md) | 모의 관제 테이블탑 15분 아젠다 |
| [docs/10-RISK-REGISTER.md](docs/10-RISK-REGISTER.md) | 위험 등록부 (가상) |
| [docs/11-DATA-CLASSIFICATION-RETENTION.md](docs/11-DATA-CLASSIFICATION-RETENTION.md) | 데이터 분류·보존·마스킹 |
| [docs/12-ACCESS-LIFECYCLE.md](docs/12-ACCESS-LIFECYCLE.md) | 계정·권한 입사/이동/퇴사 |
| [docs/13-CONTROLS-MAPPING.md](docs/13-CONTROLS-MAPPING.md) | ISO 27001 Annex A 요지 매핑 |
| [docs/14-SECURITY-AWARENESS-METRICS.md](docs/14-SECURITY-AWARENESS-METRICS.md) | 인식·피싱 시뮬 지표(더미) |
| [docs/15-BREACH-SCENARIO-ACCOUNT-TAKEOVER.md](docs/15-BREACH-SCENARIO-ACCOUNT-TAKEOVER.md) | 침해 시나리오 1페이지(가상) |
| [docs/16-CI-SECURITY-SCANNING.md](docs/16-CI-SECURITY-SCANNING.md) | CI: Gitleaks · Trivy fs 활성화 가이드 |
| [docs/ABOUT-ME-TEMPLATE.md](docs/ABOUT-ME-TEMPLATE.md) | 본인 경험 서사 초안 (실제 vs 가상 구분) |
| [docs/assets/README.md](docs/assets/README.md) | 스크린샷 촬영 가이드 |
| [docs/adr/README.md](docs/adr/README.md) | ADR 목록 |
| [CHANGELOG.md](CHANGELOG.md) | 변경 요약 |
| [README.en.md](README.en.md) | 영문 README |
| [security/access-review-quarterly-sample.md](security/access-review-quarterly-sample.md) | 분기 접근 리뷰 샘플(더미) |
| [examples/api-contract/README.md](examples/api-contract/README.md) | **DL-BFF** OpenAPI 3.0 더미 계약 |
| [docs/ABOUT-ME-FILLED-SAMPLE.md](docs/ABOUT-ME-FILLED-SAMPLE.md) | 예시 서사(가상 인물 — **본인으로 교체**) |

## 디렉터리 구조

```text
01/
├── docs/                    # 기획·아키텍처·운영 문서
├── examples/demo-stack/     # DL-PORTAL Nginx 데모 (/health)
├── examples/monitoring-lab/ # Prometheus + Alertmanager + Grafana + Blackbox
├── examples/api-contract/   # DL-BFF OpenAPI 더미 (구현 없음)
├── examples/sample-data/    # CMDB CSV, 앱 로그, 인시던트 타임라인(더미)
├── automation/scripts/      # 헬스·디스크·로그·백업 스텁
├── infra/terraform/         # random 리소스 예제 (로컬 검증용)
├── infra/ansible/           # localhost 기준선 플레이북
├── monitoring/examples/     # Prometheus 알림 샘플
├── security/                # 정책·CVE 템플릿
└── .github/workflows/ci.yml # GitHub Actions (push/PR 자동)
```

### GitHub Actions

- 워크플로는 [`.github/workflows/ci.yml`](.github/workflows/ci.yml)에 있습니다. `main`/`master`로 푸시하거나 PR을 열면 실행됩니다.
- `gh` HTTPS 토큰에 **workflow** 권한이 없으면 **워크플로 YAML을 푸시할 때만** 거절될 수 있습니다. (이미 레포에 포함된 경우 클론 후 수정·푸시 시 필요)

```bash
gh auth refresh -h github.com -s workflow
```

- 보안 스캔·Trivy 튜닝: [docs/16-CI-SECURITY-SCANNING.md](docs/16-CI-SECURITY-SCANNING.md)
- 로컬 품질 게이트·브랜치 보호: [CONTRIBUTING.md](CONTRIBUTING.md)

## 독자별 추천 읽기 순서

- **채용 담당자**: `README` → `docs/00-PORTFOLIO-BRIEF.md` → `docs/03-RUNBOOKS.md` 앞부분.
- **SRE / 인프라**: `docs/01-ARCHITECTURE.md` → `examples/demo-stack` → `examples/monitoring-lab` → `automation/scripts` → `infra/*`.
- **보안 / 관제**: `docs/02-SECURITY-GOVERNANCE.md` → `docs/10-RISK-REGISTER.md` → `docs/11`~`15` → `security/` → `monitoring/examples` → `docs/08-MONITORING-LAB.md`.

## 02 · 03 · 11 포트폴리오와 나누기

01은 **통합 운영 레퍼런스**로 두고, 02는 관측성/SLO, 03은 인시던트·포스트모템, **11은 취약점·패치 운영 쇼케이스**입니다. (상세는 [포트폴리오 브리프](docs/00-PORTFOLIO-BRIEF.md) 참고.)

## 기여 · 스크린샷 · 예시 서사

- [CONTRIBUTING.md](CONTRIBUTING.md)
- 스크린샷·목업: [docs/assets/README.md](docs/assets/README.md) (`grafana-dashboard-mockup.png` = **AI 목업**, 실제 캡처로 교체 권장)
- 예시 서사(가상 인물·**교체 필수**): [docs/ABOUT-ME-FILLED-SAMPLE.md](docs/ABOUT-ME-FILLED-SAMPLE.md)

## 라이선스 · 보안

- [LICENSE](LICENSE) (MIT)
- [SECURITY.md](SECURITY.md) — 실제 연락처는 본인 정보로 교체하세요.

---

*이 README는 지원 직무(SRE, 클라우드 엔지니어, 보안운영)에 맞게 한두 문단만 수정해 재사용해도 됩니다.*
