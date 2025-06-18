#--------------------GENERAL------------------------
variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}
#---------------------------SQL SERVER--------------------------

variable "name"{
  description = "Name of the sql server"
  type        = string
}

variable "sqlserverusername" {
  description = "administrator_login"
  type        = string
}
variable "sqlserverpassword" {
  description = "administrator_login_password"
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
  default     = "2025-06-17"
}

variable "created_by" {
  description = "Creator email"
  type        = string
  default     = "Roshan.AbdulQadir@CybersoftNA.com"
}
