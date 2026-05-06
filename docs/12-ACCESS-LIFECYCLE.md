# 계정·권한 라이프사이클 — 데모랩

> 입사·이동·퇴사 시 **계정·키·그룹**을 빠뜨리지 않기 위한 체크리스트입니다.

## 입사 (Onboarding)

- [ ] HR 시스템과 **동일 시작일**에 계정 생성
- [ ] 기본 그룹만 부여, **최소 권한** 원칙
- [ ] MFA 등록 완료 후에만 VPN/SSH 허용
- [ ] 감사 로그에 **생성 이벤트** 기록

## 이동 (Transfer)

- [ ] 이전 역할 그룹 **제거** 후 신규 그룹 추가
- [ ] 공유 계정·서비스 계정 **재검토** (불필요 시 회수)
- [ ] `access-review-quarterly-sample.md`에 반영

## 퇴사 (Offboarding)

- [ ] **즉시** SSO·VPN·SSH 키·API 토큰 비활성화
- [ ] 공유 채널·달력·리포지토리 권한 회수
- [ ] 30일 내 **완전 삭제 vs 보존(법무)** 결정 기록

## 검토 로그 (더미)

| 일자 | 대상 | 유형 | 담당 | 비고 |
|------|------|------|------|------|
| 2026-04-01 | `bff-deploy-bot` | 퇴사 연동 | `@lee-platform` | 토큰 폐기 |
| 2026-04-18 | `app-lab-03` sudoers | 이동 | `@kim-oncall` | 읽기 전용으로 축소 |

## 연계 문서

- [security/access-review-quarterly-sample.md](../security/access-review-quarterly-sample.md)
