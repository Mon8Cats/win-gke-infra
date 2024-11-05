#!/bin/bash

# Variables
PROJECT_ID="win-gke-cicd"
BUCKET_NAME="win-gke-cicd-tf-backend"
LOCATION="us-central1"  # You can change this to any GCP region

# Create a GCS bucket
gcloud config set project $PROJECT_ID
gcloud storage buckets create gs://$BUCKET_NAME --location=$LOCATION

echo "Bucket gs://$BUCKET_NAME created in $LOCATION for project $PROJECT_ID."


# give the script execution permission
# chmod +x create_bucket.sh

# run the script
# ./create_bucket.sh
