terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backendrg001"
    storage_account_name = "backendstorage001"
    container_name       = "tfstate"
    key                  = "todo.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5416df71-d346-4f44-91f2-dacb0ad37467"
}
