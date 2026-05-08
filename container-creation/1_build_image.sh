#! /usr/bin/env bash

echo "* Build Image *"

source set_container_envars

# Why do we change the domain nameservers? The code for
# installing the bridge to system package manager (bspm)
# accesses a Ubuntu keyserver, and the DNS my ISP provides
# does not appear to handle that correctly. Using CloudFlare
# or Google nameservers works, so here they are.
echo "Building $DBX_CONTAINER_IMAGE"
echo "Building CPU image"
podman image build \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --file $CONTAINERFILE \
  --tag $DBX_CONTAINER_IMAGE \
  --squash-all \
  .

echo ""
podman system prune --force
echo ""
podman image list

echo "* Finished Build Image *"
echo ""
