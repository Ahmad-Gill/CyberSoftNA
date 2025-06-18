output "app_service_plan_id" {
  value = module.app_service_plan.id
}

output "app_service_1_url" {
  value = module.app_service_1.default_site_hostname
}

output "app_service_2_url" {
  value = module.app_service_2.default_site_hostname
}
