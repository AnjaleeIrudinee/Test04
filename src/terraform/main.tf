

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
}

resource "azurerm_resource_group" "devops" {
  name     = "devops"
  location = "West Europe"
}
 

resource "azurerm_storage_account" "storagetest01" {
  name                     = "storageaccounttest"
  resource_group_name      = azurerm_resource_group.devops.name
  location                 = azurerm_resource_group.devops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

provider "azurerm" {
  features {}
 
}