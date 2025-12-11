#!/bin/bash

echo "Pulling latest code..."
git pull

echo "Building Docker image for linux/arm64..."
if docker build --platform linux/arm64 -t smadi0x86-site .; then
    echo "Build successful."

    echo "Stopping old container..."
    docker stop smadi-site || true
    docker rm smadi-site || true

    echo "Starting new container..."
    docker run -d \
      --name smadi-site \
      --restart unless-stopped \
      -p 3000:3000 \
      smadi0x86-site

    echo "Cleaning up old images..."
    docker image prune -f

    echo "Update complete."
else
    echo "Build failed. The site remains online with the previous version."
    exit 1
fi
