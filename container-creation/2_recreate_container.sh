#! /usr/bin/env bash

echo "* Recreate Container *"

source set_container_envars

./host-utilities/configure-selinux.sh

podman container run \
  --interactive \
  --tty \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --dns 8.8.4.4 \
  --hostname $CONTAINER_NAME \
  --name $CONTAINER_NAME --replace \
  --publish $RSTUDIO_SERVER_PORT:$RSTUDIO_SERVER_PORT \
  --publish $OLLAMA_SERVER_PORT:$OLLAMA_SERVER_PORT \
  --publish $SSH_SERVER_PORT:$SSH_SERVER_PORT \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  $CONTAINER_IMAGE \
  /sbin/init

echo "* Finished Recreate Container *"
echo ""
