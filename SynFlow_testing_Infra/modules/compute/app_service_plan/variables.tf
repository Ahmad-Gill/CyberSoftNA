#_----------------------General----------------------------
variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

#_--------------------Appservice plan---------------------
variable "name" {
  type = string
}

variable "os_type" {
  type = string
}
variable "sku" {
  type = string
   default     = "F1"
}
variable "tier" {
  type = string
  default     = "Free"
}
#------------------------Tags----------------------------
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