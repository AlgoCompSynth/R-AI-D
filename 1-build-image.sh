#! /usr/bin/env -S bash

set -eu

echo ""
echo "* Build Image *"

mkdir --parents $HOME/Logfiles
echo "..Starting build - logfile is $HOME/Logfiles/build-image.log"
/usr/bin/time podman image build \
  --file Containerfile \
  --format docker \
  --squash-all \
  --tag r-ai-d-base:latest \
  . \
  > $HOME/Logfiles/build-image.log 2>&1

echo ""
podman image list

echo "* Finished Build Image *"
echo ""
