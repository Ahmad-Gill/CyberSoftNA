resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.app_service_plan_id 

  site_config {
    always_on = false                          
  }

  tags = {
    environment   = var.environment
    creation_date = var.creation_date
    created_by    = var.created_by
  }
}
