#!/bin/bash
# Script to stop a Docker container using Docker Compose
docker compose -f ./compose.yaml down
# Check if the container stopped successfully
if [ $? -eq 0 ]; then
    echo "Container stopped successfully."
else
    echo "Failed to stop the container."
    exit 1
fi
# Display the status of the running containers
docker ps