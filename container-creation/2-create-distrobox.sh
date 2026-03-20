#! /usr/bin/env bash

set -e

echo "* Create Distrobox *"

echo ""
echo "Start:"
podman images

source set_envars

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

mkdir --parents $OLLAMA_MODELS_HOST
distrobox create \
  --volume $OLLAMA_MODELS_HOST:$OLLAMA_MODELS_CONTAINER \
  --init \
  --additional-flags "--security-opt=label=disable" \
  --additional-flags "--device=nvidia.com/gpu=all"
# see https://distrobox.it/useful_tips/#using-nvidia-container-toolkit
echo ""
echo "After create:"
podman images

echo "Setting up desktop and command line"
mkdir --parents $DBX_CONTAINER_DIRECTORY/.local/bin
mkdir --parents $DBX_CONTAINER_DIRECTORY/Logfiles
mkdir --parents $DBX_CONTAINER_DIRECTORY/Projects
mkdir --parents $DBX_CONTAINER_DIRECTORY/Scripts
cp Scripts/* $DBX_CONTAINER_DIRECTORY/Scripts
cp set_envars $DBX_CONTAINER_DIRECTORY/Scripts

echo "Setting R dotfiles"
cp Scripts/Rprofile $DBX_CONTAINER_DIRECTORY/.Rprofile
cp Scripts/Renviron $DBX_CONTAINER_DIRECTORY/.Renviron

echo "Populating container home"
echo ""
distrobox enter $DBX_CONTAINER_NAME -- \
  su - $USER -c "ls -al $DBX_CONTAINER_DIRECTORY/Scripts"
echo ""
echo "After enter:"
podman images

echo ""
sleep 10
pushd $DBX_CONTAINER_DIRECTORY/Scripts
  for script in \
    "linuxbrew.sh" \
    "starship.sh" \
    "coding-assistants.sh" \
    "nerd-fonts.sh"

  do
    distrobox enter $DBX_CONTAINER_NAME -- su $USER -c ./$script
    echo ""
    echo "After $script:"
    podman images

  done

popd

echo ""
echo "Creating entry script $ENTRY_SCRIPT"
echo "echo 'Enabling & starting ollama.service'" \
    > $ENTRY_SCRIPT
echo \
    "distrobox enter $DBX_CONTAINER_NAME -- sudo systemctl enable --now ollama.service" \
    >> $ENTRY_SCRIPT
echo "distrobox enter $DBX_CONTAINER_NAME" \
    >> $ENTRY_SCRIPT
chmod +x $ENTRY_SCRIPT

echo "* Finished Create Distrobox *"
echo ""
