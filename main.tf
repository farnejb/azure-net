terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "pet" {
  source  = "carljavier/pet/random"
  version = "0.0.4"
  string_length = 5
}

resource "azurerm_resource_group" "example" {
  name     = "${var.test_variable}-123"
  location = "EastUS2"
  tags = {
    environment = "sand"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = module.pet.random_pet_nickname #"example-network-update-1"
  address_space       = ["10.0.0.0/16"]
  location            = "EastUS2" #azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  
  tags = {
    environment = "sand"
  }
  
  depends_on = [
    azurerm_resource_group.example
  ]
}
