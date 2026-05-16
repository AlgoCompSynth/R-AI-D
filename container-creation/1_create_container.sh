#! /usr/bin/env bash

echo "* Create Container *"

source set_container_envars

# Why do we change the domain nameservers? The code for
# installing the bridge to system package manager (bspm)
# accesses a Ubuntu keyserver, and the DNS my ISP provides
# does not appear to handle that correctly. Using CloudFlare
# or Google nameservers works, so here they are.
echo "Building $CONTAINER_IMAGE"
echo "Building CPU image"
podman image build \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --dns 8.8.4.4 \
  --file $CONTAINERFILE \
  --tag $CONTAINER_IMAGE \
  --squash-all \
  .

echo ""
echo "Image built - pruning"
podman system prune --force
podman image list

./host-utilities/configure-selinux.sh

podman run \
  --interactive \
  --tty \
  --cap-add=CAP_SYS_ADMIN \
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

echo "* Finished Create Container *"
echo ""
