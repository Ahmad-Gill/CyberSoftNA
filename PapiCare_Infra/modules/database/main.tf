resource "azurerm_mssql_database" "this" {
  name        = var.database.name
  server_id   = var.sql_serverid
  sku_name    = var.database.service_objective         # e.g., "S0", "P1"
  max_size_gb = var.database.max_size_gb       # Optional
  tags =var.tags
}
