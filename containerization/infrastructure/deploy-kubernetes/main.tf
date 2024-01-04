provider "azurerm" {
  features {}

  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
}

data "azurerm_container_registry" "poc_registry" {
  name                = "pocDevopsITT"
  resource_group_name = "poc-devops-itt"
}

data "azurerm_resource_group" "arg" {
  name = "poc-devops-itt"
}

variable "tenant_id" {
  type = string  
}

variable "subscription_id" {
  type = string
}