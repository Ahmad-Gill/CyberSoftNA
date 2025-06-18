terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"  #  azurerm  4.29.0  4 days ago
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6724e37f-1a98-4353-96d3-f11a8d3b45dc"
}





module "resource_group" {
  source           = "./modules/resource_group"
  resource_group   = local.resource_group
  tags             = local.tags
}
module "storage_account" {
  source              = "./modules/storage_account"
  resource_group   =module.resource_group.resource_group_outPut
  storage_account=local.storage_account
  tags             = local.tags
}




module "compute" {
  source = "./modules/compute"

  asp_name               = var.asp_name
  location               = var.location
  rg_name                = local.resource_group.name
  os_type                = var.os_type
  app_service_plan_sku   = var.app_service_plan_sku
  environment            = var.environment
  creation_date          = var.creation_date
  created_by             = var.created_by

  app_service_1_name     = var.app_service_1_name
  app_service_2_name     = var.app_service_2_name
}
module "database" {
  source = "./modules/database"

  sqlserver_name               = var.sqlserver_name
  location               = var.location
  rg_name                =  local.resource_group.name
  sqlserverusername      =var.sqlserverusername
  sqlserverpassword       =var.sqlserverpassword
  DataBase_name            =var.DataBase_name
  edition                 =var.edition
  requested_service_objective_name=var.requested_service_objective_name
  max_size_gb             =var.max_size_gb

  environment            = var.environment
  creation_date          = var.creation_date
  created_by             = var.created_by
}
