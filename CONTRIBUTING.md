# 기여 가이드 (포트폴리오 저장소)

## 브랜치·커밋

- 작은 PR을 권장합니다.
- 커밋 메시지: [Conventional Commits](https://www.conventionalcommits.org/) 스타일 권장  
  (`docs:`, `feat:`, `chore:` 등)

## 시크릿

- API 키·비밀번호·개인키는 **절대 커밋하지 마세요.**
- `.env`는 `.gitignore`에 포함되어 있습니다.

## CI

- 정의 파일: **`.github/workflows/ci.yml`** (push/PR 시 자동 실행).
- 포함: ShellCheck, Terraform, **Gitleaks**, **Trivy**(`fs`, `scanners: vuln`), Docker Compose `config` 검증, **데모 스택** 기동·`/health`·헬스 스크립트, **운영 스크립트** 스모크, **Ansible 구문**·**OpenAPI YAML** 파싱.
- `gh` 토큰에 **workflow** 스코프가 없으면 워크플로 YAML 푸시가 거절될 수 있습니다. ([docs/16-CI-SECURITY-SCANNING.md](docs/16-CI-SECURITY-SCANNING.md))

## 로컬 pre-commit (선택)

```bash
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

## 브랜치 보호 (선택)

`main`/`master`에 위 CI 잡을 **Required status checks**로 걸면 리뷰어에게 신뢰도가 올라갑니다. 설정은 저장소 **Settings → Branches → Branch protection rule**에서 합니다.

## 더미 데이터

- 가상 이름·IP·티켓은 [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md)와 맞춥니다.

## 문의

- 보안 이슈: [SECURITY.md](SECURITY.md)
