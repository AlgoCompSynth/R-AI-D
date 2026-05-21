#! /usr/bin/env bash

echo "* Run Container *"

source set_container_envars

./host-utilities/configure-selinux.sh

podman container run \
  --interactive \
  --tty \
  --hostname $CONTAINER_NAME \
  --name $CONTAINER_NAME \
  --publish $RSTUDIO_SERVER_PORT:$RSTUDIO_SERVER_PORT \
  --publish $OLLAMA_SERVER_PORT:$OLLAMA_SERVER_PORT \
  --publish $SSH_SERVER_PORT:$SSH_SERVER_PORT \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  $DNS_FLAGS \
  $CONTAINER_IMAGE \
  /sbin/init

echo "* Finished Run Container *"
echo ""
