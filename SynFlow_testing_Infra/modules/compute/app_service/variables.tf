#--------------------------General-------------------------
variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
variable "app_service_plan_id" {
  description = " app_service_plan_id"
  type        = string
}


#----------------------App Service----------------------

variable "name"{
  description = "Name of the App Service"
  type        = string
}

#---------------------------------Tags----------------------------


variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "creation_date" {
  description = "Date of creation"
  type        = string
  default     = "2025-06-13"
}

variable "created_by" {
  description = "Creator email"
  type        = string
  default     = "muhammad.ahmad@CybersoftNA.com"
}
