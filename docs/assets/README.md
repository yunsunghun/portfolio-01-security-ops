# 스크린샷·자산 가이드 (`docs/assets/`)

면접관이 **클론 없이** 훑어볼 수 있게, 아래 캡처를 만들어 이 폴더에 넣을 수 있습니다.

## 권장 파일 이름

| 파일명 | 내용 |
|--------|------|
| `grafana-demolab-dashboard.png` | Monitoring Lab 대시보드 전체 |
| `prometheus-targets-up.png` | Status → Targets 화면 (`blackbox-portal` UP) |
| `prometheus-alerts-firing.png` | (선택) `portal` 중지 후 Alerts 발화 |
| `alertmanager-silence.png` | (선택) Silences 화면 |

## 촬영 시 주의

- URL 바에 **localhost**만 보이게 하거나, 민감한 쿼리 파라미터 가리기.
- Grafana 우측 상단 프로필·조직명이 실제 회사면 **가리기**.

## README에 넣는 마크다운 예시

```markdown
## 스크린샷

![Grafana](docs/assets/grafana-demolab-dashboard.png)
```

이미지는 **용량이 커지므로** 200KB 이하로 줄이거나 Git LFS를 검토하세요.
