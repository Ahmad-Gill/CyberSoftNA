variable "resource_group_name" {}
variable "location" {}
variable "app_service_name" {}
variable "plan_id" {}

resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.plan_id

  site_config {     #application-specific configurations
    dotnet_framework_version = "v4.0"     #.NET Framework 4.0.

  }
}

output "default_site_hostname" {
  value = azurerm_app_service.app.default_site_hostname
}
