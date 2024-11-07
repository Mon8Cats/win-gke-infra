module "vpc" {
  source                  = "../../modules/m1_vpc"
  network_name            = var.network_name
  auto_create_subnetworks = false
  project_id              = var.project_id
}

module "subnet" {
  source           = "../../modules/m2_subnet"
  subnet_name      = var.subnet_name
  subnet_ip_range  = var.subnet_ip_range
  subnet_region           = var.subnet_region
  network_self_link = module.vpc.network_self_link
  project_id       = var.project_id
}

module "workloadidentity" {
  source           = "../../modules/m4_workload_identity"
  wi_pool_id = var.wi_pool_id
  wi_pool_name = var.wi_pool_name
  wi_pool_provider_id = var.wi_pool_provider_id
  github_repository = var.github_repository
  service_account_id = var.wi_sa_id
}