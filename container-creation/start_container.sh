#! /usr/bin/env bash

echo "* Start Container *"

source set_container_envars

podman container start \
  --attach \
  --interactive \
  $CONTAINER_NAME

echo "* Finished Start Container *"
echo ""
