# 모니터링 Lab — Prometheus · Blackbox · Grafana

**데모랩** 시나리오: Blackbox Exporter가 내부 Nginx `portal`의 `/health`를 프로브하고, Prometheus가 수집하며, Grafana에서 시각화합니다.

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
| Grafana | http://localhost:3000 | 기본 계정: `demolab` / `demolab-grafana` (환경 변수로 변경 가능) |
| Prometheus | http://localhost:9090 | Targets → `blackbox-portal` 상태 확인 |
| 포털(컨테이너 내부 전용) | `http://portal/health` | 호스트에서 직접 열리지 않음(의도) |

대시보드: Grafana 좌측 **Dashboards** → **DemoLab — Monitoring Lab**.

## 포트 변경

```bash
PROM_PORT=9091 GRAFANA_PORT=3001 docker compose up -d
```

## 보안 주의

- Lab 전용 비밀번호입니다. **공개 인터넷에 노출하지 마세요.**
- 프로덕션에서는 OIDC·강한 비밀번호·리버스 프록시 뒤에 두세요.

## 종료

```bash
docker compose down
```

## 문서

- 설계·면접용 설명: [docs/08-MONITORING-LAB.md](../../docs/08-MONITORING-LAB.md)
- 더미 규약: [docs/DUMMY-CANON.md](../../docs/DUMMY-CANON.md)

## `demo-stack`과의 관계

- `examples/demo-stack`: 호스트 포트로 단독 데모.
- `monitoring-lab`: **관측 스택**이 한 compose에 묶인 Lab. 필요 시 두 스택을 동시에 띄워도 포트만 충돌하지 않게 조정하면 됩니다.
