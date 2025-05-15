#!/bin/bash

set -e

# === INPUTS ===
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <version> <ecr_repository_url>"
  echo "Example: ./push-to-ecr.sh v1.2.3 123456789012.dkr.ecr.us-east-1.amazonaws.com/demo-flask-app"
  exit 1
fi

VERSION=$1
ECR_URL=$2
REGION="us-east-1"

echo "🛰️  Pushing Docker image to ECR"
echo "ECR Repository URL: $ECR_URL"
echo "Image Version Tag: $VERSION"

# === AUTHENTICATE TO ECR ===
echo "🔐 Logging in to ECR..."
aws ecr get-login-password --region "$REGION" \
  | docker login --username AWS --password-stdin "$ECR_URL"

# === BUILD IMAGE ===
echo "🐳 Building image: flask-app:$VERSION"
docker build -t flask-app:$VERSION .

# === TAG IMAGE ===
echo "🏷️  Tagging image with ECR repository"
docker tag flask-app:$VERSION $ECR_URL:$VERSION
docker tag flask-app:$VERSION $ECR_URL:latest

# === PUSH IMAGE ===
echo "📤 Pushing to ECR..."
docker push $ECR_URL:$VERSION
docker push $ECR_URL:latest

echo "✅ Successfully pushed:"
echo "   → $ECR_URL:$VERSION"
echo "   → $ECR_URL:latest"
