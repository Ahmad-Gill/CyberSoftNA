module "app_service_plan" {
  source   = "./app_service_plan"
  name     = var.asp_name
  location = var.location
  rg_name  = var.rg_name
  os_type  = var.os_type
  sku      = var.app_service_plan_sku
  tier     = var.app_service_plan_tier
  environment   = var.environment
  creation_date = var.creation_date
  created_by    = var.created_by
}

module "app_service_1" {
  source              = "./app_service"
  name                = var.app_service_1_name
  location            = var.location
  rg_name             = var.rg_name
  app_service_plan_id = module.app_service_plan.id
  environment         = var.environment
    creation_date = var.creation_date
  created_by    = var.created_by
}

module "app_service_2" {
  source              = "./app_service"
  name                = var.app_service_2_name
  location            = var.location
  rg_name             = var.rg_name
  app_service_plan_id = module.app_service_plan.id
  environment         = var.environment
    creation_date = var.creation_date
  created_by    = var.created_by
}
