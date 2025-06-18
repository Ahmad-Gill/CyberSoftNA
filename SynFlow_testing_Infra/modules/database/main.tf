module "sql_server" {
  source   = "./sql_server"
  name     = var.sqlserver_name
  location = var.location
  rg_name  = var.rg_name
  sqlserverusername=var.sqlserverusername
  sqlserverpassword=var.sqlserverpassword

  environment   = var.environment
  creation_date = var.creation_date
  created_by    = var.created_by
}

module "DataBase" {
  source              = "./DataBase"
  name                = var.DataBase_name
  location            = var.location
  rg_name             = var.rg_name
  sku_name             = var.edition
  requested_service_objective_name=var.requested_service_objective_name
  max_size_gb         =var.max_size_gb

  server_id = module.sql_server.sql_server_id
  environment         = var.environment
    creation_date = var.creation_date
  created_by    = var.created_by
}
