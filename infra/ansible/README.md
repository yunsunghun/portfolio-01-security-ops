# Ansible 샘플

서버 기준선 점검을 **로컬호스트 dry-run 개념**으로 시연합니다.  
실제 SSH 대상 서버가 없어도 `ansible-playbook` 구문 검증에 활용할 수 있습니다.

## 사전 요구

```bash
pip install ansible
```

## 실행 (구문·태스크 확인)

```bash
cd infra/ansible
ansible-playbook -i inventory.example.yml playbook.yml --check
```

`--check`는 가능한 모듈에서만 변경 없이 시뮬레이션합니다. `ping` 모듈은 실제로 localhost에 ICMP가 아닌 연결 확인을 수행합니다.
