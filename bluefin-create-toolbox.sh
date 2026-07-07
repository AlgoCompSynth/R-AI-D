#! /usr/bin/env -S bash -l

set -eu

echo "* Bluefin: Create Toolbox *"

echo "..Toolbox is standard equipment on Bluefin!!"

echo "..Creating toolbox"
toolbox --assumeyes create \
  --image quay.io/fedora/fedora-toolbox:44 \
  R-AI-D-toolbox
toolbox list

pushd ./populate-toolbox
  toolbox run \
    --container R-AI-D-toolbox \
    ./1-system-setup.sh

popd

echo "* Finished Bluefin: Create Toolbox *"
echo ""
