resource "azurerm_service_plan" "app_service_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name

  os_type   = var.os_type 
  sku_name = var.sku
      tags = {
    environment   = var.environment
    creation_date = var.creation_date
    created_by    = var.created_by
  }
}
