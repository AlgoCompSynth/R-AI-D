#! /usr/bin/env bash

echo "* Enter Container *"

source set-host-envars
distrobox enter $CONTAINER_NAME -- sudo systemctl enable --now rstudio-server.service
distrobox enter $CONTAINER_NAME -- sudo systemctl enable --now ollama.service
distrobox enter $CONTAINER_NAME -- su $USER -c bash --login

echo "* Finished Enter Container *"
echo ""
