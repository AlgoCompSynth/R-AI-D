#! /usr/bin/env -S bash -l

set -eu

echo "* Ubuntu: Create Toolbox *"

echo "..Making sure 'toolbox' is installed"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qqy \
  git \
  podman-toolbox

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

echo "* Finished Ubuntu: Create Toolbox *"
echo ""
