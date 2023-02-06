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

resource "azurerm_resource_group" "example" {
  name     = "${var.test_variable}PCU1-EIMAnalytics-RG-001"
  location = "EastUS2"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network-update-1"
  address_space       = ["10.0.0.0/16"]
  location            = "EastUS2" #azurerm_resource_group.example.location
  resource_group_name = "example-resources" #azurerm_resource_group.example.name
  
  tags = {
    environment = "dev"
  }
  
  depends_on = [
    azurerm_resource_group.example
  ]
}
