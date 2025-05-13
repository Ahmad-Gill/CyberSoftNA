terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "latest"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main_resource_group" {
  name     = "rg-ceatedAt-02022025-Eus-MuhamamdAhmad"
  location = "East US"
}
