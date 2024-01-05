provider "azurerm" {
  features {}

  subscription_id = "e4c9144b-b968-4637-ab69-8e867d33b201"
  tenant_id       = "faa9a254-14cd-419d-9c55-f11ae45ca9b8"
  client_id       = "4ef7c402-cf28-4739-b2f3-76a5d6cb0e5c"
  client_secret   = var.client_secret
}

variable "client_secret" {
  type = string
}

resource "azurerm_resource_group" "rg" {
  name     = "MyTFRssourceGroup"
  location = "westus2"
}

resource "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = "aks_devop_cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksDevopClusterITT"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s_cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8s_cluster.kube_config_raw
  sensitive = true
}