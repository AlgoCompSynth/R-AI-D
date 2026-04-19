#! /usr/bin/env bash

echo "* Set RStudio Server Password *"

source set_container_envars

echo "..Starting container"
$DBX_CONTAINER_MANAGER start $DBX_CONTAINER_NAME

echo "..Browsing to RStudio Server"
xdg-open http://localhost:8787
