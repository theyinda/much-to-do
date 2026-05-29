#!/bin/bash
echo "Starting MuchToDo with docker-compose..."
docker compose up --build -d
echo "Services started!"
echo "Backend: http://localhost:8080"
echo "Mongo Express: http://localhost:8081"
