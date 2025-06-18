#----------------------General------------------------------
variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
 default     = "Central US"
}

#-----------------------App Service plan-------------------------



variable "asp_name" {
  description = "Name of the App Service Plan"
  type        = string
}
variable "os_type" {
  description = "Name of the os_type  windows/Linix"
  type        = string
}


variable "app_service_plan_sku" {
  description = "sku F1/B1..."
  default     = "F1"
}
variable "app_service_plan_tier" {
  description = "sku Free/Basic..."
  default     = "Free"
}

#-------------------App Services----------------------------

variable "app_service_1_name" {
      description = "Name of first app service"
  type        = string
}
variable "app_service_2_name" {
description = "Name of second app service"
  type        = string
}

#-----------------------Tags-------------------------------
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
