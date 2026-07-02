#! /usr/bin/env bash

echo "* Start Container *"

source set-container-envars

podman container start \
  $CONTAINER_NAME

echo "* Finished Start Container *"
echo ""
