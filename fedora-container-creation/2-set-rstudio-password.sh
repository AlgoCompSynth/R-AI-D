#! /usr/bin/env -S bash -l

set -e

echo "* Set RStudio Password *"

echo ""
echo "You need to set an RStudio Server login password for $USER"
distrobox enter fedora-distrobox -- sudo passwd $USER

echo "* Finished Set RStudio Password *"
echo ""
