#! /usr/bin/env bash

echo "* Re-create Distrobox *"

source set-host-envars

echo "..Re-creating $CONTAINER_NAME"
distrobox assemble create \
  --name $CONTAINER_NAME

pushd ../fedora-44-native
  distrobox enter $CONTAINER_NAME -- ./1-system-setup.sh
popd

echo "* Finished Re-create Distrobox *"
echo ""
