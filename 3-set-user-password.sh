#! /usr/bin/env bash

echo ""
echo "* Set User Password *"

source set-host-envars

echo "..You need to set a user password to log into RStudio Server"
distrobox enter $CONTAINER_NAME -- sudo passwd $USER

echo "* Finished Set User Password *"
echo ""
