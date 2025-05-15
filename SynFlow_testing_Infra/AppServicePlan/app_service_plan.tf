variable "resource_group_name" {}
variable "location" {}
variable "plan_name" {}
variable "sku_tier" {}
variable "sku_size" {}

resource "azurerm_app_service_plan" "plan" {
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

output "plan_id" {
  value = azurerm_app_service_plan.plan.id
}
