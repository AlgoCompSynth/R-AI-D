#! /usr/bin/env bash

set -e

echo ""
echo "Configuring SELinux if needed"

# See https://podman-desktop.io/docs/podman/gpu, Linux tab, section 4
testval=$(getenforce 2>&1 || true)
if [[ "$testval" == "Enforcing" ]]
then
  export SELINUX_ENFORCING=true

else
  export SELINUX_ENFORCING=false

fi

echo "SELINUX_ENFORCING: $SELINUX_ENFORCING"

if [[ $SELINUX_ENFORCING != "true" ]]
then
  echo "SELinux Enforcing is NOT in effect."
  echo "No action is needed!"
  echo "Finished Configuring SELinux"
  echo ""
  exit

fi

echo "SELinux Enforcing has been detected."

if [[ "$(getsebool container_use_devices)" =~ "container_use_devices --> on" ]]
then 
  echo "container_use_devices --> on"
  echo "No action is needed!"
  echo "Finished Configuring SELinux"
  echo ""
  exit

fi

echo "Executing 'sudo setsebool -P container_use_devices true' will allow container GPU access"
echo "Enter 'YES' to do that."
read -r -p "? " response
echo "Response was '$response'."

if [[ "$response" == "YES" ]]
then
  echo "sudo setsebool -P container_use_devices true"
  sudo setsebool -P container_use_devices true

fi

echo "Finished Configuring SELinux"
echo ""
