#! /usr/bin/env -S bash -l

set -e

echo "* Run Fedora Distrobox *"

distrobox enter fedora-distrobox -- sudo systemctl enable --now rstudio-server.service
distrobox enter fedora-distrobox -- sudo systemctl enable --now ollama.service
/usr/bin/time distrobox enter fedora-distrobox

echo "* Finished Run Fedora Distrobox *"
echo ""
