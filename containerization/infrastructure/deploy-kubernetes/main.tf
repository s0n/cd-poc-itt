provider "azurerm" {
  features {}

  subscription_id   = var.az_secret.subsciption_id
  tenant_id         = var.az_secret.tenant_id
}

data "azurerm_container_registry" "poc_registry" {
  name                = "pocDevopsITT"
  resource_group_name = "poc-devops-itt"
}

data "azurerm_resource_group" "arg" {
  name = "poc-devops-itt"
}

variable "az_secret" {
  type = object({
    tenant_id = string
    subsciption_id = string
  })
  
}