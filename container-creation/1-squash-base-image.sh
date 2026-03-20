#! /usr/bin/env bash

echo "Building $BASE_IMAGE_TAG"
source set_envars
podman image build \
  --security-opt=label=disable \
  --device=nvidia.com/gpu=all \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --file $BASE_CONTAINERFILE \
  --tag $BASE_IMAGE_TAG \
  --squash-all \
  .

echo ""
podman system prune --force
echo ""
podman image list
