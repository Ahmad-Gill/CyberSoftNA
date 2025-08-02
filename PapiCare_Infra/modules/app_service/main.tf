resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.sevice_plan.resource_group_location
  resource_group_name = var.sevice_plan.resource_group_name
  service_plan_id     = var.sevice_plan.app_service_plan_id 
  site_config {
    always_on = false                          
  }
  tags =var.tags
}
