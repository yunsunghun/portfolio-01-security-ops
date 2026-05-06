# CI 보안 스캔 (Gitleaks · Trivy)

## 목적

- **Gitleaks**: 커밋·히스토리에 **시크릿 패턴**이 있는지 검사합니다.
- **Trivy (`fs`)**: 저장소 내 **공지 취약점**(의존성 매니페스트 등)을 스캔합니다. CI에서는 **`scanners: vuln`** 만으로 게이트해 Compose/Terraform **설정 오탐**을 줄입니다. Misconfig까지 막고 싶으면 `.github/workflows/ci.yml`의 `scanners` 입력을 조정하세요.

## 위치

- CI 정의는 **`.github/workflows/ci.yml`** 한 곳만 유지합니다. (ShellCheck, Terraform, Gitleaks, Trivy, Compose 검증, 데모 스택 스모크, Ansible·OpenAPI 검증)

## 푸시가 거절될 때 (`workflow` 스코프)

`gh` HTTPS 토큰에 **workflow** 권한이 없으면 `.github/workflows/*.yml` 푸시가 막힐 수 있습니다.

```bash
gh auth refresh -h github.com -s workflow
git push
```

## Trivy 실패 시

1. **오탐**: `.trivyignore`에 경로·CVE ID를 추가하고 **사유 주석**을 남깁니다.
2. **실취약점**: 의존성 업그레이드 또는 해당 디렉터리를 스캔 대상에서 제외하지 않고 **조치**합니다.

`exit-code`를 일시적으로 `"0"`으로 바꾸면 CI는 통과하지만 **권장하지 않습니다**(경고만 보고 넘어가기).

## Gitleaks 설정 커스터마이즈

- 루트 **`.gitleaks.toml`** 에서 allowlist·규칙을 조정합니다. (본 레포는 `security/access-review-quarterly-sample.md` 가상 표기 오탐만 예외 처리)

## 관련 위험 등록부

- [10-RISK-REGISTER.md](10-RISK-REGISTER.md) `R-004` (CI/의존성)
