#! /usr/bin/env bash

echo "* Create Container *"

source set_container_envars

./host-utilities/configure_selinux.sh

podman run \
  --interactive \
  --tty \
  --cap-add=CAP_SYS_ADMIN \
  --publish $RSTUDIO_SERVER_PORT:$RSTUDIO_SERVER_PORT \
  --name $CONTAINER_NAME --replace \
  $NVIDIA_FLAGS \
  $CONTAINER_IMAGE \
  /sbin/init

echo "* Finished Create Container *"
echo ""
