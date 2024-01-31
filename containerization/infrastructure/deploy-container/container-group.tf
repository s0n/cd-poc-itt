resource "azurerm_container_group" "container-poc" {
  name                = "${terraform.workspace}-poc-container-group"
  location            = azurerm_resource_group.rg-container.location
  resource_group_name = azurerm_resource_group.rg-container.name
  dns_name_label      = "${terraform.workspace}-itt-poc-devops"
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
    environment = "${terraform.workspace}"
  }
}