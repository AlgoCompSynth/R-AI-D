#! /usr/bin/env bash

set -e

echo "* Configure SELinux *"

source set_container_envars

# See https://podman-desktop.io/docs/podman/gpu, Linux tab, section 4
if [[ $SELINUX_ENFORCING == "true" ]]
then
  echo "SELinux Enforcing has been detected."
  echo "Executing 'sudo setsebool -P container_use_devices true' will allow container GPU access"
  echo "Enter 'YES' to do that."
  read -r -p "? " response
  echo "Response was '$response'."

  if [[ "$response" == "YES" ]]
  then
    echo "sudo setsebool -P container_use_devices true"
    sudo setsebool -P container_use_devices true

  fi

fi

echo "* Finished Configure SELinux *"
echo ""
