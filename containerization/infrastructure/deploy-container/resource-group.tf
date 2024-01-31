resource "azurerm_resource_group" "rg-container" {
  name     = "${terraform.workspace}-RG-Container-POC-ITT"
  location = "eastus"
}