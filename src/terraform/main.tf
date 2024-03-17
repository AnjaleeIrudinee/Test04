
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "devops"
    storage_account_name = "terraformgithubactions"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate"
   
  }
}

provider "azurerm" {
  features {}
 
}
resource "azurerm_storage_account" "storagetest01" {
  name                     = "storageaccounttest"
  resource_group_name      = azurerm_resource_group.devops.name
  location                 = azurerm_resource_group.devops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
