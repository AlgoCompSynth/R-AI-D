#! /usr/bin/env bash

echo "* Build Image *"

source set_container_envars

echo "Building $CONTAINER_IMAGE"
podman image build \
  $AUDIO_FLAGS \
  $NVIDIA_PODMAN_FLAGS \
  $SECURITY_FLAGS \
  --env ADMIN_USER=$(id --user --name) \
  --file $CONTAINERFILE \
  --tag $CONTAINER_IMAGE \
  --squash-all \
  .

echo ""
podman image list

echo "* Finished Build Image *"
echo ""
