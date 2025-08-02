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
module "app_service_plan" {
  source = "./modules/app_service_plan"
  app_service_plan=local.app_service_plan
  resource_group   =module.resource_group.resource_group_outPut
  tags             = local.tags
}

module "app_service_frontend" {
  source = "./modules/app_service"
  name = local.app_services.frontend
  sevice_plan=module.app_service_plan.app_service_plan_info
  tags             = local.tags
}
module "app_service_backend" {
  source = "./modules/app_service"
  name = local.app_services.backend
  sevice_plan=module.app_service_plan.app_service_plan_info
  tags             = local.tags
}

module "sql_server" {
  source = "./modules/sql_server"
  resource_group=module.resource_group.resource_group_outPut
  sql_server=local.sql_server
  tags             = local.tags
}
module "database" {
  source = "./modules/database"
  database=local.database
  sql_serverid=module.sql_server.sql_server_id
  tags             = local.tags
}