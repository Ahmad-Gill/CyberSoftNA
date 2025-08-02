resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server.name
  resource_group_name          =var.resource_group.name
  location                     =  var.resource_group.location
  version                      = "12.0"
  administrator_login          = var.sql_server.username
  administrator_login_password = var.sql_server.password
 tags =var.tags
}