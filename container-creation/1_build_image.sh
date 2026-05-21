#! /usr/bin/env bash

echo "* Build Image *"

source set_container_envars

if [[ "${#1}" > "0" ]]
then
  echo "First argument is non-empty - entering debug mode"
  export SQUASH=""
  export PRUNE=""

else
  echo "Normal mode - for debug mode, use a non-empty first argument"
  export SQUASH="--squash-all "
  export PRUNE="podman system prune --force"

fi
echo ""
echo "SQUASH: $SQUASH"
echo "PRUNE: $PRUNE"
echo ""

# Why do we change the domain nameservers? The code for
# installing the bridge to system package manager (bspm)
# accesses a Ubuntu keyserver, and the DNS my ISP provides
# does not appear to handle that correctly. Using CloudFlare
# or Google nameservers works, so here they are.
echo "Building $CONTAINER_IMAGE"
podman image build \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  --env ADMIN_USER=$(id --user --name) \
  --dns 1.1.1.1 \
  --dns 1.0.0.1 \
  --dns 8.8.8.8 \
  --dns 8.8.4.4 \
  --file $CONTAINERFILE \
  --tag $CONTAINER_IMAGE \
  $SQUASH \
  .

echo ""
$PRUNE
podman image list

echo "* Finished Build Image *"
echo ""
