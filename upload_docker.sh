#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="amitshr90/amitfinalproject"

# Step 2:  
# Authenticate & tag
docker logout
docker login && docker image tag amitfinalproject $dockerpath
# Step 3:
# Push image to a docker repository
docker image push $dockerpath
