variable "sql_serverid" {
  description = "sql_serverid configuration"
  type = string
}

variable "database" {
  description = "Storage account configuration"
  type = object({
    name             = string
    max_size_gb     = string
    service_objective = string
  })
}

variable "tags" {
  description = "A map of tags"
  type        = map(string)
}
