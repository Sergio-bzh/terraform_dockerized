#!/bin/bash
# Script to start a Docker container with a specific image and port mapping 
docker compose -f ./compose.yaml up -d --build
# Check if the container started successfully
if [ $? -eq 0 ]; then
    echo "Container started successfully."
else
    echo "Failed to start the container."
    exit 1
fi
# Display the status of the running containers
docker ps