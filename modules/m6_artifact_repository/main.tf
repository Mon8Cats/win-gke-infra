
resource "google_artifact_registry_repository" "docker_repository" {
  project       = var.project_id
  name          = var.repository_name
  location      = var.region
  repository_id    = var.repository_name
  description      = var.description
  format           = "DOCKER"
  mode             = var.mode
  labels           = var.labels

  lifecycle {
    prevent_destroy = var.prevent_destroy
  }
}

