
# create WI pool
resource "google_iam_workload_identity_pool" "github_pool" {
  provider                  = google-beta
  workload_identity_pool_id = var.wi_pool_id
  display_name              = var.wi_pool_name
  description               = "Infra WI Pool"

  depends_on = [google_project_service.enable_pre_apis]
}

# create WI provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  provider = google-beta

  workload_identity_pool_id         = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.wi_pool_provider_id
  display_name                      = "Infra WI Pool Provider"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  # Specify the condition to match GitHub's repository claim
  attribute_condition = "attribute.repository == '${var.github_repository}'"

  depends_on = [google_project_service.enable_pre_apis]
}


# bind the service account with workload Identity
resource "google_service_account_iam_binding" "workload_identity_binding" {
  service_account_id = var.service_account_id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_repository}"
  ]

}


