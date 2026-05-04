# 로컬 데모 스택

## 기동

```bash
cd examples/demo-stack
docker compose up -d
```

## 확인

```bash
curl -sf http://localhost:8080/health
```

포트를 바꾸려면 `DEMO_PORT=9090 docker compose up -d` 처럼 환경 변수를 사용합니다.

## 종료

```bash
docker compose down
```
