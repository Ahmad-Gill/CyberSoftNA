variable "sevice_plan" {
  description = "sevice_plan configuration"
  type = object({
    resource_group_name     = string
    resource_group_location = string
    app_service_plan_id=string
  })
}
variable "tags" {
  description = "A map of tags to apply to the resource group"
  type        = map(string)
}
variable "name" {
  description = "name of app service"
  type        = string
}