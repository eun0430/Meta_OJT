# Default Set
variable "name" {
  type = string
  default = "test"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "vnet_address_space" {
  type = string
  default = "10.0.0.0/8"
}

variable "vnet_aks_subnet_space" {
  type = string
  default = "10.1.0.0/16"
}

variable "vnet_agw_subnet_space" {
  type = string
  default = "10.2.0.0/16"
}

variable "vnet_cicd_subnet_space" {
  type = string
  default = "10.3.0.0/16"
}