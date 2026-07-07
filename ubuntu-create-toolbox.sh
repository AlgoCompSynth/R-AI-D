#! /usr/bin/env -S bash -l

set -eu

echo "* Ubuntu: Create Toolbox *"

echo "..Making sure 'toolbox' is installed"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qqy podman-toolbox

echo "..Creating toolbox"
toolbox --assumeyes create \
  --image quay.io/fedora/fedora-toolbox:44 \
  R-AI-D-f44
toolbox list

pushd ./fedora-44-native
  toolbox run \
    --container R-AI-D-f44 \
    ./1-system-setup.sh

popd

echo "* Finished Ubuntu: Create Toolbox *"
echo ""
