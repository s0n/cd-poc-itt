terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  #Before use remote backend you have to create a storage account and storage container on azure
  backend "azurerm" {
    resource_group_name  = "poc-ressource-group"
    storage_account_name = "tfstatepocdevopsitt"
    container_name       = "tfstatetest"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

variable "application_version" {
  type = string
}

variable "env" {
  type = string
}


resource "azurerm_resource_group" "rg-container" {
  name     = "MyTFRssourceGroup-Container"
  location = "eastus"
}

# Deployment in PROD env
resource "azurerm_container_group" "container-poc" {
  name                = "${var.env}-poc-container-group"
  location            = azurerm_resource_group.rg-container.location
  resource_group_name = azurerm_resource_group.rg-container.name
  dns_name_label      = "ITT-POC-DevOps"
  os_type             = "Linux"

  container {
    name   = "poc-devops-container"
    image  = "sngbango/app-poc:${var.application_version}"
    cpu    = "0.5"
    memory = "1.5"
    ports {
      port     = 3000
      protocol = "TCP"
    }
  }

  tags = {
    environment = "${var.env}"
  }
}