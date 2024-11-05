#!/bin/bash

# Variables
REGION="us-central1"
CONNECTION_NAME="cicd-connection"
PROJECT_ID="win-gke-cicd"
REPOSITORY_NAME_1="Mon8Cats/win-gke-infra"
REPOSITORY_NAME_2="Mon8Cats/win-gke-app"



# Repository 1
gcloud alpha builds repositories create \
  --region=$REGION \
  --connection=$CONNECTION_NAME \
  --repository=$REPOSITORY_NAME_1 \
  --project=$PROJECT_ID

echo "Repository '$REPOSITORY_NAME_1' linked successfully in Cloud Build."

# Repository 2

gcloud alpha builds repositories create \
  --region=$REGION \
  --connection=$CONNECTION_NAME \
  --repository=$REPOSITORY_NAME_2 \
  --project=$PROJECT_ID

echo "Repository '$REPOSITORY_NAME_2' linked successfully in Cloud Build."


# gcloud alpha builds repositories list --region=us-central1


# give the script execution permission
# chmod +x create_bucket.sh

# run the script
# ./create_bucket.sh