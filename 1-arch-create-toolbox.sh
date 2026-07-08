#! /usr/bin/env -S bash -l

set -eu

echo "* Arch: Create Toolbox *"

echo "..Making sure 'toolbox' is installed"
sudo pacman -Syu --noconfirm \
  git \
  toolbox

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

echo "* Finished Arch: Create Toolbox *"
echo ""
