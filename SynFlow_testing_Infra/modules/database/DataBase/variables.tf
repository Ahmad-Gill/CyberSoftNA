#-------------------GENERAL-------------------------------
variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}
variable "server_id" {
  type = string
}

#-------------------------DTABASE------------------------------
variable "name" {
  type = string
}

variable "sku_name" {
  description = "SQL Database sku_name (Basic, Standard, Premium)"
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

#--------------------------TAGS-----------------------------
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