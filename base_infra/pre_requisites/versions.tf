# versions.tf

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }

   backend "gcs" {
    bucket  = var.backend_bucket_name # The GCS bucket name
    prefix  = var.backend_bucket_prefix  # Path to the state file within the bucket (use different paths for different environments)
    project = var.project_id    # The GCP project ID
  }
}