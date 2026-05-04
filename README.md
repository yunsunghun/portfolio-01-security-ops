# 포트폴리오 01 — 보안관제 · 서비스 · 서버 운영

클라우드 계정 없이도 **문서·코드·CI**로 운영 역량을 설명할 수 있게 구성한 저장소입니다.  
인사 담당자는 *역할과 성과를 말로 확장할 수 있는 뼈대*를, 엔지니어는 *실행·검증 가능한 아티팩트*를 빠르게 확인할 수 있습니다.

## 한 줄 요약

**가용성 점검, 서버 기준선, 보안 거버넌스 문서, 인시던트 런북**을 한 레포에 묶고, **Docker 데모 + Terraform/Ansible 샘플 + CI 정의(`docs/reference-github-actions-ci.yml`)**로 재현성을 보여 줍니다.

## 이 저장소로 보여 주고 싶은 역량

| 영역 | 내용 |
|------|------|
| 서비스 운영 | 헬스체크, 배포 체크리스트, 롤백 판단 프레임 |
| 서버 운영 | 디스크·로그 점검 스크립트, Ansible 기준선 예시 |
| 보안 관제 | 기준선 체크리스트, CVE 대응 템플릿, CI 정적 분석 |

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
   ```

3. **Terraform (클라우드 자원 없음)**

   ```bash
   cd infra/terraform
   terraform init
   terraform apply -auto-approve
   ```

   로컬에 Terraform이 없어도, 푸시 후 GitHub Actions에서 `fmt`·`validate`가 실행됩니다.

환경 변수 예시는 [`.env.example`](.env.example)를 참고하세요.

## 문서 맵 (기획 → 운영)

| 문서 | 용도 |
|------|------|
| [docs/00-PORTFOLIO-BRIEF.md](docs/00-PORTFOLIO-BRIEF.md) | 기획·범위·성공 지표·02/03 분리 제안 |
| [docs/01-ARCHITECTURE.md](docs/01-ARCHITECTURE.md) | 논리 아키텍처·확장 메모 |
| [docs/02-SECURITY-GOVERNANCE.md](docs/02-SECURITY-GOVERNANCE.md) | 보안·관제 거버넌스 |
| [docs/03-RUNBOOKS.md](docs/03-RUNBOOKS.md) | 장애·관제 런북 + 시뮬레이션 과제 |
| [docs/04-DEPLOYMENT-CHECKLIST.md](docs/04-DEPLOYMENT-CHECKLIST.md) | 릴리즈·롤백 체크리스트 |

## 디렉터리 구조

```text
01/
├── docs/                    # 기획·아키텍처·운영 문서
├── examples/demo-stack/     # Nginx 데모 (/health)
├── automation/scripts/      # 헬스·디스크·로그·백업 스텁
├── infra/terraform/         # random 리소스 예제 (로컬 검증용)
├── infra/ansible/           # localhost 기준선 플레이북
├── monitoring/examples/     # Prometheus 알림 샘플
├── security/                # 정책·CVE 템플릿
└── docs/reference-github-actions-ci.yml  # GitHub Actions CI (복사해 활성화)
```

### GitHub Actions를 켜려면

`gh` HTTPS 토큰에 **workflow** 권한이 있어야 `.github/workflows/`에 YAML을 푸시할 수 있습니다. 아래 후 이 파일을 `.github/workflows/ci.yml`로 복사해 커밋하세요.

```bash
gh auth refresh -h github.com -s workflow
mkdir -p .github/workflows
cp docs/reference-github-actions-ci.yml .github/workflows/ci.yml
git add .github/workflows/ci.yml && git commit -m "ci: GitHub Actions 추가" && git push
```

## 독자별 추천 읽기 순서

- **채용 담당자**: `README` → `docs/00-PORTFOLIO-BRIEF.md` → `docs/03-RUNBOOKS.md` 앞부분.
- **SRE / 인프라**: `docs/01-ARCHITECTURE.md` → `examples/demo-stack` → `automation/scripts` → `infra/*`.
- **보안 / 관제**: `docs/02-SECURITY-GOVERNANCE.md` → `security/` → `monitoring/examples`.

## 02 · 03 포트폴리오와 나누기

01은 **통합 운영 레퍼런스**로 두고, 02는 관측성/SLO, 03은 침해 대응·컴플라이언스 심화를 권장합니다. (상세는 포트폴리오 브리프 참고.)

## 라이선스 · 보안

- [LICENSE](LICENSE) (MIT)
- [SECURITY.md](SECURITY.md) — 실제 연락처는 본인 정보로 교체하세요.

---

*이 README는 지원 직무(SRE, 클라우드 엔지니어, 보안운영)에 맞게 한두 문단만 수정해 재사용해도 됩니다.*
