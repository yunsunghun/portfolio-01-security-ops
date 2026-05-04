# Terraform 예제 (클라우드 비의존)

이 디렉터리는 **실제 AWS/GCP 자원을 만들지 않습니다.**  
`random` 프로바이더만 사용해 Terraform 작성·검증 워크플로를 포트폴리오에 포함합니다.

## 사용법

```bash
cd infra/terraform
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

실제 클라우드 모듈을 추가할 때는 `modules/` 하위에 VPC, 컴퓨트, IAM을 분리하는 패턴을 권장합니다.
