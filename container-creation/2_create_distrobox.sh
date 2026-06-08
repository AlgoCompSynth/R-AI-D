#! /usr/bin/env -S bash

echo "* Create Distrobox *"

source set_container_envars

./host-utilities/configure-selinux.sh

if [[ "$(distrobox list | grep $CONTAINER_NAME | wc -l)" != "0" ]]

then
  echo "..removing existing container $CONTAINER_NAME"
  distrobox rm --force $CONTAINER_NAME

fi

if [[ -d $CONTAINER_HOME ]]

then
  echo "..removing existing directory $CONTAINER_HOME"
  rm --force --recursive $CONTAINER_HOME

fi

distrobox create \
  --image $CONTAINER_IMAGE \
  --name $CONTAINER_NAME \
  --hostname $CONTAINER_NAME \
  --home $CONTAINER_HOME \
  $DISTROBOX_NVIDIA_FLAGS \
  $DISTROBOX_SECURITY_FLAGS \
  --init

echo "..setting up container command line"
cp --dereference --recursive command-line-installers/ $CONTAINER_HOME
pushd $CONTAINER_HOME/command-line-installers/
  distrobox enter $CONTAINER_NAME -- ./1_command_line_setup.sh
popd

echo "* Finished Create Distrobox *"
echo ""
