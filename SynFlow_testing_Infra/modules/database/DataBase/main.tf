resource "azurerm_mssql_database" "this" {
  name        = var.name
  server_id   = var.server_id
  sku_name    = var.sku_name         # e.g., "S0", "P1"
  max_size_gb = var.max_size_gb      # Optional

  tags = {
    environment   = var.environment
    creation_date = var.creation_date
    created_by    = var.created_by
  }
}
