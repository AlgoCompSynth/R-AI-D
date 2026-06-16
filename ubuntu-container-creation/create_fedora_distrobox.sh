#! /usr/bin/env -S bash -l

set -e

echo "* Create Fedora Distrobox *"

distrobox assemble create \
 --file fedora-distrobox.ini

pushd command-line-installers > /dev/null
  distrobox enter fedora-distrobox  -- su $USER ./fedora-installs.sh
  distrobox enter fedora-distrobox  -- su $USER ./1_command_line_setup.sh

popd > /dev/null

echo "* Finished Create Fedora Distrobox *"
echo ""
