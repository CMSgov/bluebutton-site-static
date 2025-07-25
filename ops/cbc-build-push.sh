#!/usr/bin/env bash

DOCKER_TAG=${1:-rb312}

docker build --file Dockerfile.cbc-build \
  --build-arg RUBY_VERSION=${2:-3.3.5} \
  --tag public.ecr.aws/q8j7a4l4/bb2-cbc-build:${DOCKER_TAG} \
  .

docker push public.ecr.aws/q8j7a4l4/bb2-cbc-build:${DOCKER_TAG}
