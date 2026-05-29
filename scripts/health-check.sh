#!/bin/bash
URL=${1:-http://localhost:8080}
echo "Checking health at $URL/health..."
response=$(curl -s -o /dev/null -w "%{http_code}" $URL/health)
if [ $response -eq 200 ]; then
  echo "Health check passed!"
  exit 0
else
  echo "Health check failed! HTTP $response"
  exit 1
fi
