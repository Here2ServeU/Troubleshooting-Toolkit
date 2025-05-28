#!/bin/bash
# Remove all unused Docker images
echo "Cleaning up unused Docker images..."
docker image prune -a -f
