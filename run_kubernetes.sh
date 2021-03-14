#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="amitshr90/amitfinalproject"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run amitfinalproject\
    --generator=run-pod/v1\
    --image=$dockerpath
    --expose
    --port=9000 --labels app=amitfinalproject

# Step 3:
# List kubernetes pods
kubectl get pods
