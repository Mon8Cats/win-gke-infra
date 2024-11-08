module "workloadidentity" {
  source           = "../../modules/m4_workload_identity"
  project_id = var.project_id
  wi_pool_id = var.wi_pool_id
  wi_pool_name = var.wi_pool_name
  wi_pool_provider_id = var.wi_pool_provider_id
  github_repository = var.github_repository
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.wi_sa_id}@${var.project_id}.iam.gserviceaccount.com"
}

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


module "allow_http_https" {
  source         = "../../modules/m3_firewall"
  project_id     = var.project_id
  rule_name      = "allow-http-https"
  network        = module.vpc.network_self_link
  direction      = "INGRESS"
  priority       = 1000
  allow_protocol = "tcp"
  allow_ports    = ["80", "443"]
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["web-server"]
}

module "allow_ssh" {
  source         = "../../modules/m3_firewall"
  project_id     = var.project_id
  rule_name      = "allow-ssh"
  network        = module.vpc.network_self_link
  direction      = "INGRESS"
  priority       = 1000
  allow_protocol = "tcp"
  allow_ports    = ["22"]
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["ssh-access"]
}


module "artifact_registry_repository" {
  source         = "../../modules/m6_artifact_repository"
  project_id = var.project_id
  region = var.project_region
  repository_id = "win_repo"
}