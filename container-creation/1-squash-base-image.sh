#! /usr/bin/env bash

source set_container_envars

echo "Building $DBX_CONTAINER_IMAGE"
if [[ "$ARCH" == "aarch64" || "$COMPUTE_MODE" == "CPU" ]]
then
  echo "Building CPU image"
  podman image build \
    --dns 1.1.1.1 \
    --dns 1.0.0.1 \
    --dns 8.8.8.8 \
    --file $CONTAINERFILE \
    --tag $DBX_CONTAINER_IMAGE \
    --squash-all \
    .

else

  echo "Building NVIDIA GPU image"
  podman image build \
    --security-opt=label=disable \
    --device=nvidia.com/gpu=all \
    --dns 1.1.1.1 \
    --dns 1.0.0.1 \
    --dns 8.8.8.8 \
    --file $CONTAINERFILE \
    --tag $DBX_CONTAINER_IMAGE \
    --squash-all \
    .

fi

echo ""
podman system prune --force
echo ""
podman image list

echo "Inspecting built image to 'built-inspect.json'"
podman image inspect $DBX_CONTAINER_IMAGE > built-inspect.json
