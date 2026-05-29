#!/bin/bash
set -e
echo "Building backend Docker image..."
cd Server/MuchToDo
docker build -t $ECR_REPOSITORY_URL:latest .
echo "Pushing to ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY_URL
docker push $ECR_REPOSITORY_URL:latest
echo "Triggering rolling deployment..."
aws autoscaling start-instance-refresh --auto-scaling-group-name starttech-asg
echo "Backend deployed!"
