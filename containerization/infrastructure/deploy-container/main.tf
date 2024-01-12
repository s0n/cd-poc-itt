terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "poc-ressource-group"
      storage_account_name = "tfstatepocdevopsitt"
      container_name       = "tfstatetest"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}

//  subscription_id = "e4c9144b-b968-4637-ab69-8e867d33b201"
//  tenant_id       = "faa9a254-14cd-419d-9c55-f11ae45ca9b8"
//  client_id       = "4ef7c402-cf28-4739-b2f3-76a5d6cb0e5c"
//  client_secret   = var.client_secret
}

variable "client_secret" {
  type = string
}
/*
variable "app_version" {
  type = string
}
*/
resource "azurerm_resource_group" "rg-container" {
  name     = "MyTFRssourceGroup-Container"
  location = "eastus"
}

resource "azurerm_container_group" "container-poc" {
  name                = "poc-container-group"
  location            = azurerm_resource_group.rg-container.location
  resource_group_name = azurerm_resource_group.rg-container.name
  dns_name_label      = "ITT-POC-DevOps"
  os_type    = "Linux"

  container {
    name   = "poc-devops-container"
    image  = "sngbango/app-poc:0.2"
    cpu    = "0.5"
    memory = "1.5"
    ports {
      port     = 3000
      protocol = "TCP"
    }
  }

  tags = {
    environment = "dev"
  }
}