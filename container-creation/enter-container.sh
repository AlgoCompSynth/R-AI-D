#! /usr/bin/env bash

echo "* Enter Container *"

source set-container-envars

podman container exec \
  --interactive \
  --tty \
  --user $USER \
  --workdir /home/$USER \
  $CONTAINER_NAME \
  bash --login

echo "* Finished Enter Container *"
echo ""
