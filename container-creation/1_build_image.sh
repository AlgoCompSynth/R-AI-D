#! /usr/bin/env bash

echo "* Build Image *"

if [[ "${#1}" < "12" ]]
then
  echo "The first argument must at leat 12 characters for the 'admin' password."
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
#podman system prune --force
podman image list

echo "* Finished Build Image *"
echo ""
