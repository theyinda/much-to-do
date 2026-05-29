# MuchToDo - Container Assessment

## Overview
MuchToDo is a Golang REST API backed by MongoDB, containerised with Docker and deployable to Kubernetes using Kind.

## Prerequisites
- Docker Desktop (running)
- Kind (`brew install kind`)
- kubectl (`brew install kubectl`)

## Phase 1: Docker

### Build the image
```bash
./scripts/docker-build.sh
```

### Run with docker-compose
```bash
./scripts/docker-run.sh
```

### Verify
- Backend API: http://localhost:8080/health
- Mongo Express: http://localhost:8081 (admin/admin123)

### Stop
```bash
docker compose down
```

## Phase 2: Kubernetes

### 1. Install Kind and kubectl
```bash
brew install kind kubectl
```

### 2. Create Kind cluster
```bash
kind create cluster --name muchtodo-cluster
```

### 3. Build and load image
```bash
./scripts/docker-build.sh
kind load docker-image muchtodo-backend:latest --name muchtodo-cluster
```

### 4. Deploy
```bash
./scripts/k8s-deploy.sh
```

### 5. Access the app
```bash
kubectl port-forward svc/backend-service 8080:8080 -n muchtodo
```
Then visit: http://localhost:8080/health

### 6. Check status
```bash
kubectl get all -n muchtodo
```

### 7. Cleanup
```bash
./scripts/k8s-cleanup.sh
kind delete cluster --name muchtodo-cluster
```
