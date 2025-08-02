locals {
  # --------------------------- Resource Group ------------------------
  resource_group = {
    name     = "RG-TRACKCURE-DEV-CUS"
    location = "Central US"
  }

  # --------------------------- App Service Plan ------------------------
  app_service_plan = {
    name  = "asp-trackcure-dev-cus"
    os    = "Windows"
    sku   = "D1"
  }

  # --------------------------- App Services ------------------------
  app_services = {
    frontend = "as-trackcure-dev-cus-fe"
    backend  = "as-trackcure-dev-cus-api"
  }

  # --------------------------- Storage Account ------------------------
  storage_account = {
    name             = "satrackcuredevcus"
    account_tier     = "Standard"
    replication_type = "LRS"
  }

  # --------------------------- SQL Server ------------------------
  sql_server = {
    name     = "sqlsrv-trackcure-dev-cus"
    username = "Admin123"
    password = "Admin@123"
  }

  # --------------------------- Database ------------------------
  database = {
    name                          = "sqldb-trackcure-dev-cus"
    service_objective             = "Basic"
    max_size_gb                   = "2"
  }

  # --------------------------- Tags ------------------------
  tags = {
    environment   = "dev"
    creation_date = "2025-06-23"
    created_by    = "muhammad.ahmad@CybersoftNA.com"
    created_by1    = "Roshaan.AbdulQadir@CybersoftNA.com"
  }
}
