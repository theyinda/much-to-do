#!/bin/bash
set -e
echo "Rolling back to previous version..."
ASG_NAME="starttech-asg"
aws autoscaling cancel-instance-refresh --auto-scaling-group-name $ASG_NAME || true
ECR_REPO=$1
PREVIOUS_TAG=$2
aws autoscaling start-instance-refresh \
  --auto-scaling-group-name $ASG_NAME \
  --preferences '{"MinHealthyPercentage": 50}'
echo "Rollback initiated!"
