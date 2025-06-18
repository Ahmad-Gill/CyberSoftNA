#-------------------------------GENEAL-------------------------
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}
#---------------------------------DATABASE-------------------------
variable "DataBase_name" {
      description = "DataBase_name"
  type        = string
}
variable "edition" {
  description = "SQL Database edition (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "requested_service_objective_name" {
  description = "Service tier objective (e.g., Basic, S0, S1, P1)"
  type        = string
  default     = "Basic" 
}

variable "max_size_gb" {
  description = "Maximum size in GB"
  type        = number
  default     = 2  
}
#-----------------------SQL SERVER---------------------------------------
variable "sqlserver_name" {
  description = "sqlserver_name"
  type        = string
}
variable "sqlserverusername" {
  description = "sqlserverusername"
  type        = string
}
variable "sqlserverpassword" {
  description = "sqlserverpassword"
  type        = string
}
#---------------------------------TAGS------------------------------
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "creation_date" {
  description = "Date of creation"
  type        = string
  default     = "2025-06-17"
}

variable "created_by" {
  description = "Creator email"
  type        = string
  default     = "Roshan.AbdulQadir@CybersoftNA.com"
}
