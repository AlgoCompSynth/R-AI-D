#! /usr/bin/env bash

echo "* Create Container *"

if [[ "${#1}" < "12" ]]
then
  echo "The first argument must at leat 12 characters for the 'r-ai-d' password."
  exit -255

fi

source set_container_envars

# Why do we change the domain nameservers? The code for
# installing the bridge to system package manager (bspm)
# accesses a Ubuntu keyserver, and the DNS my ISP provides
# does not appear to handle that correctly. Using CloudFlare
# or Google nameservers works, so here they are.
echo "Building $CONTAINER_IMAGE"
echo "Building CPU image"
podman image build \
  --build-arg ADMIN_PASSWORD=$1 \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --file $CONTAINERFILE \
  --tag $CONTAINER_IMAGE \
  --squash-all \
  .

echo ""
echo "Image built - pruning"
podman system prune --force
podman image list

./host-utilities/configure-selinux.sh

podman create \
  --cap-add=CAP_SYS_ADMIN \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --name $CONTAINER_NAME --replace \
  --publish $RSTUDIO_SERVER_PORT:$RSTUDIO_SERVER_PORT \
  --publish $OLLAMA_SERVER_PORT:$OLLAMA_SERVER_PORT \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  $CONTAINER_IMAGE \
  /sbin/init

echo "* Finished Create Container *"
echo ""
