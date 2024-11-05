#!/bin/bash

# Variables
REGION="us-central1"
CONNECTION_NAME="cicd-connection"
PROJECT_ID="win-gke-cicd"
GITHUB_USERNAME="Mon8Cats"  # Use your GitHub username
APP_INSTALLATION_ID="55957239"  # Get this from your GitHub account

# Create Cloud Build GitHub connection
gcloud alpha builds repositories connections create github \
  --region=$REGION \
  --name=$CONNECTION_NAME \
  --project=$PROJECT_ID \
  --owner=$GITHUB_USERNAME \
  --host-url=https://github.com \
  --app-installation-id=$APP_INSTALLATION_ID

echo "Cloud Build connection '$CONNECTION_NAME' created successfully."


# give the script execution permission
# chmod +x create_bucket.sh

# run the script
# ./create_bucket.sh

# how to get installion id? Setting -> applications -> google cloud build
# https://github.com/settings/installations/55957239