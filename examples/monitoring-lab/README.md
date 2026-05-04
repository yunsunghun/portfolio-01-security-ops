# 모니터링 Lab — Prometheus · Alertmanager · Grafana · Blackbox

**데모랩** 시나리오: Blackbox가 내부 Nginx `portal`의 `/health`를 프로브하고, Prometheus가 수집·**알림 규칙을 평가**하며, **Alertmanager**가 라우팅(여기서는 webhook 수신만), Grafana에서 시각화합니다.

## 스택 구성

| 서비스 | 역할 |
|--------|------|
| `portal` | DL-PORTAL 대응 정적 웹 + `/health` |
| `blackbox` | HTTP 프로브 |
| `prometheus` | 스크랩 + `alerts.yml` 평가 |
| `alertmanager` | 알림 라우팅 UI · webhook 전달 |
| `alert_sink` | Lab용 200 응답기(`hashicorp/http-echo`) — **실제 발송 대체** |
| `grafana` | 대시보드 |

## 사전 요구

- Docker Engine + Docker Compose v2

## 기동

```bash
cd examples/monitoring-lab
docker compose up -d
```

## 접속

| 구성요소 | URL | 비고 |
|----------|-----|------|
| Grafana | http://localhost:3000 | `demolab` / `demolab-grafana` (환경 변수로 변경) |
| Prometheus | http://localhost:9090 | Alerts · Status → Targets |
| **Alertmanager** | http://localhost:9093 | Silences · Status |

## 알림 시연 (선택)

1. 정상 상태에서 알림이 없는지 확인합니다.
2. 포털을 잠시 중지합니다.

   ```bash
   docker compose stop portal
   ```

3. 약 1~2분 후 Prometheus **Alerts**에 `PortalHealthProbeFailed`가 뜨고, Alertmanager에도 알림이 보일 수 있습니다.
4. 복구:

   ```bash
   docker compose start portal
   ```

## 포트 변경

```bash
PROM_PORT=9091 GRAFANA_PORT=3001 ALERTMANAGER_PORT=9094 docker compose up -d
```

## 보안 주의

- Lab 전용 비밀번호·웹훅입니다. **인터넷에 노출하지 마세요.**
- 프로덕션: Slack/PagerDuty/OIDC 등으로 교체하세요.

## 종료

```bash
docker compose down
```

## 문서

- [docs/08-MONITORING-LAB.md](../../docs/08-MONITORING-LAB.md)
- [docs/DUMMY-CANON.md](../../docs/DUMMY-CANON.md)

## `demo-stack`과의 관계

- `demo-stack`: 호스트 포트로 단독 데모.
- `monitoring-lab`: 관측·**알림 라우팅**까지 포함. 동시 기동 시 포트만 조정하면 됩니다.
