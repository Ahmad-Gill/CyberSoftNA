resource "azurerm_mssql_server" "this" {
  name                         = var.name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sqlserverusername
  administrator_login_password = var.sqlserverpassword
 tags = {
    environment   = var.environment
    creation_date = var.creation_date
    created_by    = var.created_by
  }
}