# ADR-0001: 모니터링 Lab은 단일 Docker Compose로 유지한다

## 상태

수락

## 맥락

- 포트폴리오 열람자가 **한 번에** 스택을 띄울 수 있어야 함.
- Kubernetes·Helm까지 넣으면 Windows·개인 PC에서 진입 장벽이 큼.

## 결정

- `examples/monitoring-lab/docker-compose.yml` 하나로 **portal · blackbox · prometheus · alertmanager · grafana · alert_sink**를 묶는다.
- 호스트 OS별 차이가 큰 **cAdvisor/node_exporter**는 기본 스택에서 제외하고, **exporter `/metrics` 스크랩**으로 스택 가시성을 보완한다.

## 결과

- 긍정: 재현 단순, README만으로 시연 가능.
- 부정: 프로덕션급 HA·스토리지 이중화는 문서로만 설명.
