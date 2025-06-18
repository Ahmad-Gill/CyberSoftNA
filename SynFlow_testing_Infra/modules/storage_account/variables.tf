variable "resource_group" {
  description = "Resource group configuration"
  type = object({
    name     = string
    location = string
  })
}

variable "storage_account" {
  description = "Storage account configuration"
  type = object({
    name             = string
    account_tier     = string
    replication_type = string
  })
}

variable "tags" {
  description = "A map of tags"
  type        = map(string)
}
