#! /usr/bin/env bash

echo "* Build Image *"

source set-container-envars

echo "Building $CONTAINER_IMAGE"
podman image build \
  $AUDIO_FLAGS \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  --file Containerfile \
  --tag $CONTAINER_IMAGE \
  --squash-all \
  .

echo ""
podman image list

echo "* Finished Build Image *"
echo ""
