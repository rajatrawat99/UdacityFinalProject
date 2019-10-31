#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=rajatrawat88/myrepo

#Authentication
docker login --username=rajatrawat88 --password=RajatRawat88

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run myrepo2 --image=rajatrawat88/myrepo:run2 --port=80


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/myrepo2 8000:80

