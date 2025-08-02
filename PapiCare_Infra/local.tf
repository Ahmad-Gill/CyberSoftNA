locals {
  # --------------------------- Resource Group ------------------------
  resource_group = {
    name     = "RG-PAPICARE-DEV-CUS"
    location = "Central US"
  }

  # --------------------------- App Service Plan ------------------------
  app_service_plan = {
    name  = "asp-papicare-dev-cus"
    os    = "Windows"
    sku   = "D1"
  }

  # --------------------------- App Services ------------------------
  app_services = {
    frontend = "as-papicare-dev-cus-fe"
    backend  = "as-papicare-dev-cus-api"
  }

  # --------------------------- Storage Account ------------------------
  storage_account = {
    name             = "sapapicaredevcus"
    account_tier     = "Standard"
    replication_type = "LRS"
  }

  # --------------------------- SQL Server ------------------------
  sql_server = {
    name     = "sqlsrv-papicare-dev-cus"
    username = "Admin123"
    password = "Admin@123"
  }

  # --------------------------- Database ------------------------
  database = {
    name                          = "sqldb-papicare-dev-cus"
    service_objective             = "Basic"
    max_size_gb                   = "2"
  }

  # --------------------------- Tags ------------------------
  tags = {
    environment   = "dev"
    creation_date = "2025-07-1"
    created_by    = "muhammad.ahmad@CybersoftNA.com"
  }
}
