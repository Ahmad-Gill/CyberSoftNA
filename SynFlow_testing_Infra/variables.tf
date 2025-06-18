variable "Resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

#-------------------------------Compute---------------------------------------------------


variable "asp_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_service_1_name" {
  description = "Name of the App Service Plan"
  type        = string
}
variable "app_service_2_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}
variable "os_type" {
  description = "Name of the os_type  windows/Linix"
  type        = string
}


variable "app_service_plan_sku" {
  description = "sku F1/B1..."
  default     = "F1"
}
variable "Storage_account_name" {
  description = "Name of the storage account"
  type        = string
}
variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}
variable "replication_type" {
  description = "Replication type"
  type        = string
  default     = "LRS"
}


#---------------------------------SQL erver--------------------------------
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
#--------------------DATABASE-----------------------------------
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

#----------------------------TAGS-----------------------------------------

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

