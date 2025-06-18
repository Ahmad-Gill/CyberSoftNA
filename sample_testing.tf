terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"  #  azurerm  4.29.0  4 days ago


    }
  }
  required_version = ">= 1.1.0"   #Terraform CLI   latest 1.12	4 days ago (14 May 2025)
}

provider "azurerm" {
  features {}
  subscription_id = "6724e37f-1a98-4353-96d3-f11a8d3b45dc"
}



#------------------------------------------------------ Resource Group ------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = "rg-poc-testing"
  location = "centralus"
}

#------------------------------------------------------ App Service PLan ------------------------------------------------

resource "azurerm_service_plan" "plan" {
  name                = "asp-poc-testing"
  location            = "centralus"
  resource_group_name =azurerm_resource_group.rg.name

  os_type   =  "Windows"
  sku_name  = "F1"
}

#------------------------------------------------------ App Service ---------------------------------------------------
resource "azurerm_windows_web_app" "webapp" {
  name                = "webapp-poc-testing"
  location            = azurerm_service_plan.plan.location
  resource_group_name = azurerm_service_plan.plan.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
  }
}



resource "azurerm_mssql_server" "sql" {
  name                         = "sqlserverpoctest"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "P@ssword1234!"
}


resource "azurerm_mssql_database" "sqldb" {
  name                = "sqldb-poctest"
  server_id           = azurerm_mssql_server.sql.id
}



resource "azurerm_storage_account" "storage" {
  name                     = "stgtestingmuhammadahmad" 
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

tags = {
  environment  = "poc"
  created_date = timestamp()
}

}
