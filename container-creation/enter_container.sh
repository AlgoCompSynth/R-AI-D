#! /usr/bin/env bash

echo "* Enter Container *"

source set_container_envars

podman container exec \
  --interactive \
  --tty \
  --user r-ai-d \
  --workdir /home/r-ai-d \
  $CONTAINER_NAME \
  bash --login

echo "* Finished Enter Container *"
echo ""
