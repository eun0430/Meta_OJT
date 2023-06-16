terraform {
  required_providers {
    azurerm = {
      source = "registry.terraform.io/hashicorp/azurerm"
      # version = "<=3.52.0"
    }
  }
}

# Azurerm -> Azure 인프라를 관리하기 위해 사용되는 Azure Provider -> Azure 계정 정보 설정
provider "azurerm" {
  features {
    resource_group {
      # prevent_deletion_if_contains_resources -> Resources 삭제 방지 설정
      prevent_deletion_if_contains_resources = false             # resource_group 존재 시 삭제
    }
  }

  subscription_id = "824024c8-274a-45e9-ac9e-8e4d6ea796d1"       # subscription_id : Azure 구독 계정
  tenant_id = "e6352ace-f5d6-430d-af0c-b02699765d3f"             # tenant_id :  현재 구독되어있는 Azure Directory(Tenant)

  # app registrations (앱 등록 정보 관리) 생성 -> client_id, client_secret 기입
}

# data "azurerm_subscription" "name" {
#   subscription_id = "824024c8-274a-45e9-ac9e-8e4d6ea796d1"
# }

resource "azurerm_resource_group" "test" {
  name = "${var.name}-rg"
  location = "${var.location}"
}