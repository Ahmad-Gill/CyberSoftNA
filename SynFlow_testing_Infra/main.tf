terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"           
      version = "~> 3.0"          #greater than equal to 3 but less than 4 
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}           #Initialize the provider correctly using default settings
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "app_service_plan" {                   #the reasion of using module is that it does not create the reource here. Actually it refer to an other file 
  source              = "./AppServicePlan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  plan_name           = var.app_service_plan_name
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
}

module "app_service" {
  source              = "./AppService"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  app_service_name    = var.app_service_name
  plan_id             = module.app_service_plan.plan_id
}
