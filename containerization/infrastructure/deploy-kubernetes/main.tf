provider "azurerm" {
  features {}

  subscription_id   = "e4c9144b-b968-4637-ab69-8e867d33b201"
  tenant_id         = "faa9a254-14cd-419d-9c55-f11ae45ca9b8"
  client_id         = "4ef7c402-cf28-4739-b2f3-76a5d6cb0e5c"
  client_secret     = "7b28637c-9170-42e1-bc28-6a65f4abc910"
}


/*data "azurerm_container_registry" "poc_registry" {
  name                = "pocDevopsITT"
  resource_group_name = "poc-devops-itt"
}

data "azurerm_resource_group" "arg" {
  name = "poc-devops-itt"
}*/