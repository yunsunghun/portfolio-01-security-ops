# 기여 가이드 (포트폴리오 저장소)

## 브랜치·커밋

- 작은 PR을 권장합니다.
- 커밋 메시지: [Conventional Commits](https://www.conventionalcommits.org/) 스타일 권장  
  (`docs:`, `feat:`, `chore:` 등)

## 시크릿

- API 키·비밀번호·개인키는 **절대 커밋하지 마세요.**
- `.env`는 `.gitignore`에 포함되어 있습니다.

## CI

- `docs/reference-github-actions-ci.yml`를 `.github/workflows/ci.yml`로 복사하면 Actions가 동작합니다. (`workflow` OAuth 스코프 필요)

## 더미 데이터

- 가상 이름·IP·티켓은 [docs/DUMMY-CANON.md](docs/DUMMY-CANON.md)와 맞춥니다.

## 문의

- 보안 이슈: [SECURITY.md](SECURITY.md)
