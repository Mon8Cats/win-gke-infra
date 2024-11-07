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