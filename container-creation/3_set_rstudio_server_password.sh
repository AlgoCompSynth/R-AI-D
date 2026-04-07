#! /usr/bin/env bash

echo "* Set RStudio Server Password *"

source set_container_envars

echo "..You need to set a password to log into RStudio Server!"
distrobox enter $DBX_CONTAINER_NAME -- sudo passwd $USER

echo "* Finished Set RStudio Server Password *"
echo ""
