output "resource_group_outPut" {
  description = "Resource group name and location"
  value = {
    name     = azurerm_resource_group.this.name
    location = azurerm_resource_group.this.location
  }
}


