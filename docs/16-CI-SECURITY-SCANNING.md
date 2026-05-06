# CI 보안 스캔 (Gitleaks · Trivy)

## 목적

- **Gitleaks**: 커밋·히스토리에 **시크릿 패턴**이 있는지 검사합니다.
- **Trivy (`fs`)**: 저장소 내 **공지 취약점**(의존성 매니페스트 등)을 스캔합니다.

## 활성화 방법

1. `gh auth refresh -h github.com -s workflow`
2. 아래 파일을 복사합니다.

   ```bash
   mkdir -p .github/workflows
   cp docs/reference-github-actions-ci.yml .github/workflows/ci.yml
   git add .github/workflows/ci.yml .trivyignore
   git commit -m "ci: ShellCheck, Terraform, Gitleaks, Trivy"
   git push
   ```

## Trivy 실패 시

1. **오탐**: `.trivyignore`에 경로·CVE ID를 추가하고 **사유 주석**을 남깁니다.
2. **실취약점**: 의존성 업그레이드 또는 해당 디렉터리를 스캔 대상에서 제외하지 않고 **조치**합니다.

`exit-code`를 일시적으로 `"0"`으로 바꾸면 CI는 통과하지만 **권장하지 않습니다**(경고만 보고 넘어가기).

## Gitleaks 설정 커스터마이즈

- 조직 규칙이 있으면 `.gitleaks.toml`을 루트에 추가합니다. (본 레포에는 아직 없음)

## 관련 위험 등록부

- [10-RISK-REGISTER.md](10-RISK-REGISTER.md) `R-004` (CI/의존성)
