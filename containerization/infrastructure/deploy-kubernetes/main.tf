provider "azurerm" {
  features {}

  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  client_id         = var.client_id
  client_secret     = var.client_secret
}

variable "subscription_id" {
    type = string
}
variable "tenant_id" {
    type = string
}
variable "client_id" {
    type = string
}
variable "client_secret" {
    type = string
}

/*data "azurerm_container_registry" "poc_registry" {
  name                = "pocDevopsITT"
  resource_group_name = "poc-devops-itt"
}

data "azurerm_resource_group" "arg" {
  name = "poc-devops-itt"
}*/