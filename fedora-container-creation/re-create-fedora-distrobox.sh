#! /usr/bin/env -S bash -l

set -e

echo "* Re-create Fedora Distrobox *"

/usr/bin/time distrobox assemble create \
 --file fedora-distrobox.ini

echo ""
echo "You need to set an RStudio Server login password for $USER"
distrobox enter fedora-distrobox -- sudo passwd $USER

pushd command-line-installers > /dev/null
  /usr/bin/time distrobox enter fedora-distrobox  -- ./fedora-installs.sh
  /usr/bin/time distrobox enter fedora-distrobox  -- ./1-command-line-setup.sh

popd > /dev/null

echo "Copying 'run-fedora-distrobox.sh' to $HOME/.local/bin"
cp run-fedora-distrobox.sh $HOME/.local/bin/

echo "* Finished Re-create Fedora Distrobox *"
echo ""
