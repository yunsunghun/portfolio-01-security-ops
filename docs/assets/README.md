# 스크린샷·자산 (`docs/assets/`)

## 포함된 파일

| 파일 | 설명 |
|------|------|
| `grafana-dashboard-mockup.png` | **AI 생성 UI 목업** (실제 Grafana 캡처 아님). 레이아웃 참고용. 용량 ~1.2MB — 필요 시 압축·교체 권장. |
| `monitoring-lab-wireframe.svg` | **벡터 와이어프레임** (실제 제품 스크린샷 아님). |

## 실제 캡처로 바꾸기 (권장)

면접·포트폴리오에서는 **직접 띄운 Lab 화면**이 가장 설득력 있습니다.

| 파일명 (권장) | 내용 |
|---------------|------|
| `grafana-demolab-dashboard.png` | `examples/monitoring-lab` 기동 후 대시보드 |
| `prometheus-targets-up.png` | Status → Targets (`blackbox-portal` UP) |
| `prometheus-alerts-firing.png` | (선택) `portal` 중지 후 Alerts |
| `alertmanager-alerts.png` | Alertmanager **Alerts** 탭 |

## 촬영 시 주의

- URL·조직명·프로필이 실제 회사면 **가리기**.
- 민감한 쿼리·토큰이 URL에 없는지 확인.

## README에 넣는 예시

```markdown
## 스크린샷 (Lab)

![대시보드 목업](docs/assets/grafana-dashboard-mockup.png)

*위 이미지는 AI 생성 목업입니다. 실제 Grafana 캡처로 교체하는 것을 권장합니다.*

![와이어프레임](docs/assets/monitoring-lab-wireframe.svg)
```

## 예시 서사 (가상 인물)

[../ABOUT-ME-FILLED-SAMPLE.md](../ABOUT-ME-FILLED-SAMPLE.md) — **본인 문장으로 반드시 교체**하세요.
