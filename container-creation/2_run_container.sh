#! /usr/bin/env bash

echo "* Run Container *"

source set_container_envars

./host-utilities/configure-selinux.sh

echo "..Making sure $HOST_SHARE exists"
mkdir --parents $HOST_SHARE

echo "..Running container in ten seconds"
sleep 10
podman container run \
  --interactive \
  --tty \
  --hostname $CONTAINER_NAME \
  --name $CONTAINER_NAME \
  --publish $RSTUDIO_SERVER_PORT:$RSTUDIO_SERVER_PORT \
  --publish $OLLAMA_SERVER_PORT:$OLLAMA_SERVER_PORT \
  --publish $SSH_SERVER_PORT:$SSH_SERVER_PORT \
  --userns=keep-id \
  --volume $HOST_SHARE:$CONTAINER_SHARE \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  $DNS_FLAGS \
  $CONTAINER_IMAGE \
  /sbin/init

echo "* Finished Run Container *"
echo ""
