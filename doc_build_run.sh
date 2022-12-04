#!/bin/bash

# This Docker build uses alpine, but can be set to use other other types of OS:VERSION as base 
# docker build -t cevherdogan/linwin-arvr:alpine-cpp-pathping-v1.0 .

# Building with CODE_VERSION argument for alpine as the example control value for dynamic versioning
docker build --build-arg CODE_VERSION=3.17.0_rc1 -t cevherdogan/linwin-arvr:alpine-cpp-pathping-v1.0 .

# Run the app
docker run -it cevherdogan/linwin-arvr:alpine-cpp-pathping-v1.0

# ssh to the running container 
docker run -it cevherdogan/linwin-arvr:alpine-cpp-pathping-v1.0 bash

# Inspect container logs: Just an example here, would work while the container is running. 
# In this case, container won't running after it is done.
docker logs cevherdogan/linwin-arvr:alpine-cpp-pathping-v1.0
