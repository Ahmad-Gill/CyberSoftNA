variable "resource_group" {
  description = "Resource group configuration"
  type = object({
    name     = string
    location = string
  })
}
variable "app_service_plan" {
  description = "app_service_plan configuration"
  type = object({
    name     = string
    os = string
    sku=string
  })
}
variable "tags" {
  description = "A map of tags to apply to the resource group"
  type        = map(string)
}