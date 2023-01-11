provider "azurerm" {
  version = "~> 3.0"
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "EastUS2"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = "EastUS2" #azurerm_resource_group.example.location
  resource_group_name = "example-resources" #azurerm_resource_group.example.name
  
  depends_on = [
    azurerm_resource_group.example
  ]
}
