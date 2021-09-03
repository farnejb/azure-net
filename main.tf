resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = "EastUS2" #azurerm_resource_group.example.location
  resource_group_name = "example-resources" #azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = "example-resources"
  virtual_network_name = "example-network"
  address_prefixes     = ["10.0.2.0/24"]
}