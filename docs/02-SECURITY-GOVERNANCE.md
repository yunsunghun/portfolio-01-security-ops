# 보안 거버넌스 · 관제 프레임 (데모랩)

> 규약: [DUMMY-CANON.md](DUMMY-CANON.md)

## 1. 보안 목표 (CIA + 예시 증적)

| 원칙 | 운영 행위 | Lab 증적(더미) |
|------|-----------|----------------|
| 기밀성 | SSH 키, 시크릿 미커밋 | `jmp-lab-01` 비밀번호 로그인 비활성화 기록됨 |
| 무결성 | CI 린트, 릴리즈 태그 | `REL-2026-05-02.3` 아티팩트 SHA256 보관 |
| 가용성 | 헬스·디스크 알림 | `INC-2026-0412` 대응 타임라인 |

## 2. 관제 체크리스트 (Lab 채움 예시)

| 항목 | 상태 | 메모 |
|------|------|------|
| 자산 목록 | 완료 | `examples/sample-data/asset-registry.csv` |
| 접근 로그 보존 | 30일 | `portal-web` 액세스 로그 |
| 알림 심각도 정의 | 완료 | P1~P4, `docs/03-RUNBOOKS.md` |
| 에스컬레이션 | 완료 | 온콜 → `@platform-lead` → CISO(가상) |
| RCA 템플릿 | 완료 | `security/templates/` + 03번 레포 |

## 3. 접근 통제 (서버)

| 호스트 | 역할 | 접근 방식 (가상) |
|--------|------|------------------|
| `jmp-lab-01` | 점프 | 공인키, MFA(TOTP 가정) |
| `app-lab-03` | BFF | `jmp` 경유만 SSH |
| `db-lab-01` | DB | `app` 존에서 5432만 허용 |

## 4. 취약점 대응 (예시 티켓)

| 내부 ID | 요약 | 목표일 | 상태 |
|---------|------|--------|------|
| DLAB-SEC-2026-001 | nginx 베이스 이미지 업그레이드 | 2026-05-10 | 완화 완료(문서) |

상세 양식: `security/templates/cve-response-template.md` (빈 양식 + 채움 예시 포함).

## 5. CI/CD 보안

- ShellCheck 대상: `automation/scripts/*.sh`
- (선택) `gitleaks` — 조직 정책 시 `pre-push` 훅.

## 6. 한계

실제 SIEM/SOAR 연동은 범위 밖. **02** 관측성 레포에서 메트릭·알림을 확장합니다.

## 7. 보안 프로그램 문서 (담당관 관점)

- 위험 등록: [10-RISK-REGISTER.md](10-RISK-REGISTER.md)
- 데이터 분류·보존: [11-DATA-CLASSIFICATION-RETENTION.md](11-DATA-CLASSIFICATION-RETENTION.md)
- 접근 라이프사이클: [12-ACCESS-LIFECYCLE.md](12-ACCESS-LIFECYCLE.md)
- 통제 매핑: [13-CONTROLS-MAPPING.md](13-CONTROLS-MAPPING.md)
- 인식 교육 지표: [14-SECURITY-AWARENESS-METRICS.md](14-SECURITY-AWARENESS-METRICS.md)
- 침해 시나리오: [15-BREACH-SCENARIO-ACCOUNT-TAKEOVER.md](15-BREACH-SCENARIO-ACCOUNT-TAKEOVER.md)
