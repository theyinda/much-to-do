# StartTech Applicationn

## Overview
Full-stack application with React frontend and Golang backend.

## Structure
- `Client/` — React frontend (Vite + TypeScript)
- `Server/MuchToDo/` — Golang backend API

## CI/CD Pipelines
- **Frontend**: builds React app and deploys to S3/CloudFront
- **Backend**: builds Docker image, pushes to ECR, deploys via ASG rolling update

## Required GitHub Secrets
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `S3_BUCKET_NAME`
- `CLOUDFRONT_DISTRIBUTION_ID`
- `CLOUDFRONT_DOMAIN`
- `VITE_API_BASE_URL`
- `ALB_DNS_NAME`

## Local Development
### Frontend
```bash
cd Client
npm install
npm run dev
```

### Backend
```bash
cd Server/MuchToDo
go run ./cmd/api
```
