#! /usr/bin/env bash

set -e

echo "* Create Distrobox *"

echo ""
echo "Start:"
podman images

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

echo "Making sure $OLLAMA_MODELS_HOST exists"
mkdir --parents $OLLAMA_MODELS_HOST

echo "Creating $DBX_CONTAINER_NAME"
if [[ "$ARCH" == "aarch64" || "$COMPUTE_MODE" == "CPU" ]]
then
  echo "Creating CPU container"
  distrobox create \
    --volume $OLLAMA_MODELS_HOST:$OLLAMA_MODELS_CONTAINER:rw \
    --init

else
  echo "Creating NVIDIA GPU container"
  distrobox create \
    --volume $OLLAMA_MODELS_HOST:$OLLAMA_MODELS_CONTAINER:rw \
    --init \
    --additional-flags "--security-opt=label=disable" \
    --additional-flags "--device=nvidia.com/gpu=all"
  # see https://distrobox.it/useful_tips/#using-nvidia-container-toolkit

fi

echo ""
echo "After create:"
podman images

echo "Inspecting created image to 'created-inspect.json"
podman image inspect $DBX_CONTAINER_IMAGE > created-inspect.json

echo "Setting up container desktop and command line"
pushd Scripts
  distrobox enter $DBX_CONTAINER_NAME -- su $USER -c "./1_command_line_setup.sh"
popd

echo ""
echo "After command line setup:"
podman images

echo ""
echo "Creating entry script $ENTRY_SCRIPT"
echo "echo 'Enabling & starting ollama.service'" \
    > $ENTRY_SCRIPT
echo \
    "distrobox enter $DBX_CONTAINER_NAME -- sudo systemctl enable --now ollama.service" \
    >> $ENTRY_SCRIPT
echo "sleep 5" >> $ENTRY_SCRIPT
echo "distrobox enter $DBX_CONTAINER_NAME" \
    >> $ENTRY_SCRIPT
chmod +x $ENTRY_SCRIPT

echo "* Finished Create Distrobox *"
echo ""
