#!/bin/bash
set -e
echo "Building frontend..."
cd Client
npm ci
npm run build
echo "Deploying to S3..."
aws s3 sync dist/ s3://$S3_BUCKET_NAME --delete
echo "Invalidating CloudFront..."
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*"
echo "Frontend deployed!"
