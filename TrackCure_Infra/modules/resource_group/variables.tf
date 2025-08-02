variable "resource_group" {
  description = "Resource group configuration"
  type = object({
    name     = string
    location = string
  })
}
variable "tags" {
  description = "A map of tags to apply to the resource group"
  type        = map(string)
}