#! /usr/bin/env bash

echo "* Re-create Distrobox *"

source set-host-envars

echo "..Re-creating $CONTAINER_NAME"
distrobox assemble create \
  --name $CONTAINER_NAME

echo "..You need to set a password for $USER in $CONTAINER_NAME:"
distrobox enter $CONTAINER_NAME -- sudo passwd $USER

pushd populate-container
  distrobox enter $CONTAINER_NAME -- ./1-system-setup.sh
popd

echo "* Finished Re-create Distrobox *"
echo ""
