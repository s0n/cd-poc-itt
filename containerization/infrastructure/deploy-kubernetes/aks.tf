resource "azurerm_resource_group" "rg" {
  name = "MyTFRssourceGroup"
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