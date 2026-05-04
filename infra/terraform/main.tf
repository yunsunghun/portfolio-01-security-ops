terraform {
  required_version = ">= 1.5.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# 데모: 배포 단위 식별자 생성 (실제 리소스 없음)
resource "random_id" "deployment" {
  byte_length = 4
}

output "deployment_suffix" {
  description = "예시 배포 식별 접미사 (로그/태그 네이밍 패턴 시연용)"
  value       = random_id.deployment.hex
}
