output "app_service_plan_info" {
  description = "Resource Group name, location, and App Service Plan ID"
  value = {
    resource_group_name = var.resource_group.name
    resource_group_location = var.resource_group.location
    app_service_plan_id = azurerm_service_plan.app_service_plan.id
  }
}
