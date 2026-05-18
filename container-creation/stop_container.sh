#! /usr/bin/env bash

echo "* Stop Container *"

source set_container_envars

podman container stop \
  $CONTAINER_NAME

echo "* Finished Stop Container *"
echo ""
