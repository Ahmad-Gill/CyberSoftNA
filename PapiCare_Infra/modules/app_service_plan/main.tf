resource "azurerm_service_plan" "app_service_plan" {
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  name                = var.app_service_plan.name
  os_type   = var.app_service_plan.os
  sku_name = var.app_service_plan.sku
  tags =var.tags
}
