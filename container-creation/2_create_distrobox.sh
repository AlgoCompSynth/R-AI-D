#! /usr/bin/env bash

echo "* Create Distrobox *"

source set_container_envars

if [[ "$(podman container list --all | grep $DBX_CONTAINER_NAME | wc -l)" != "0" ]]
then
 echo "Force-removing container $DBX_CONTAINER_NAME"
 podman container rm --force $DBX_CONTAINER_NAME

fi

if [[ -d $DBX_CONTAINER_DIRECTORY ]]
then
 echo "Force-removing directory $DBX_CONTAINER_DIRECTORY"
 rm --force --recursive $DBX_CONTAINER_DIRECTORY

fi

echo "Creating $DBX_CONTAINER_NAME"
if [[ "$COMPUTE_MODE" == "CPU" ]]
then
  echo "Creating CPU container"
  distrobox create \
    --init

else
  echo "Creating NVIDIA GPU container"
  distrobox create \
    --init \
    --additional-flags "--security-opt=label=disable" \
    --additional-flags "--device=nvidia.com/gpu=all"
  # see https://distrobox.it/useful_tips/#using-nvidia-container-toolkit

fi

pushd Scripts > /dev/null
  echo "Setting up container services"
  distrobox enter $DBX_CONTAINER_NAME -- su $USER -c "./rstudio_server_latest.sh"
  distrobox enter $DBX_CONTAINER_NAME -- su $USER -c "./ollama.sh"
  distrobox enter $DBX_CONTAINER_NAME -- sudo usermod --append --groups ollama $USER

  echo "Setting up container desktop and command line"
  distrobox enter $DBX_CONTAINER_NAME -- su $USER -c "./1_command_line_setup.sh"
popd > /dev/null

echo ""
echo "Creating entry script $ENTRY_SCRIPT"
echo "distrobox enter $DBX_CONTAINER_NAME -- sudo su $USER" \
    > $ENTRY_SCRIPT
chmod +x $ENTRY_SCRIPT

echo ""
podman system prune --force
echo ""
podman image list --all
echo ""
podman container list --all
echo ""
distrobox list
echo ""

echo "* Finished Create Distrobox *"
echo ""
