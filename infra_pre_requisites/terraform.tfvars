# environments/dev/terraform.tfvars

project_id = "win-gke-cicd"
project_number = "650839457214"
region     = "us-central1"

pre_api_list   = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudbuild.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
    "cloudresourcemanager.googleapis.com"

    #"cloudbuild.googleapis.com",       # Cloud Build API
    #"artifactregistry.googleapis.com", # Artifact Registry API
    #"iam.googleapis.com",              # IAM API
    #"compute.googleapis.com",          # Compute Engine API
    #"run.googleapis.com",              # Cloud Run API
    #"cloudfunctions.googleapis.com",   # Cloud Functions API
    #"container.googleapis.com",        # Kubernetes Engine API
    #"appengine.googleapis.com",        # App Engine Admin API
    #"cloudresourcemanager.googleapis.com", # Resource Manager API
    # Add or remove APIs as needed
  ]

backend_bucket_name = "win-gke-cicd-tf-backend"
backend_bucket_prefix = "terraform/state/infra" 

wi_sa_id = "infra-service-account"
wi_pool_id = "infra-github-cicd-pool"
wi_pool_name = "infra-github-cicd-pool"
wi_provider_id = "infra-github-provider"

github_repository      = "Mon8Cats/win-gke-infra"
github_account         = "Mon8Cats"  # Optional if needed
github_repo_only  = "win-gke-infra"


wi_sa_roles = [
  "roles/cloudbuild.builds.builder",
  "roles/source.reader",
  "roles/artifactregistry.reader",
  "roles/storage.admin",
  "roles/run.admin",
  "roles/container.developer",
  "roles/iam.serviceAccountUser",
  #"roles/secretmanager.admin",
  #"roles/secretmanager.secretAccessor",
  #"roles/secretmanager.secretCreator"
]

trigger_name = "infra-cicd-trigger"