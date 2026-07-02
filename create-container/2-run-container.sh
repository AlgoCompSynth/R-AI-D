#! /usr/bin/env bash

set -eu

echo "* Run Container *"

source set-container-envars

./configure-selinux.sh

echo "..Running container"
podman container run \
  --detach \
  --hostname $CONTAINER_NAME \
  --name $CONTAINER_NAME \
  --publish $RSTUDIO_SERVER_PORT:$RSTUDIO_SERVER_PORT \
  --replace \
  --userns=keep-id \
  $AUDIO_FLAGS \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  $CONTAINER_IMAGE

echo "..Setting you up as an admin user"
export USER_HOME="/home/${USER}"
podman container exec --user root $CONTAINER_NAME \
  mkdir --parents $USER_HOME
podman container exec --user root $CONTAINER_NAME \
  cp -rp /etc/skel/.bash* /etc/skel/.config /etc/skel/.z* $USER_HOME/
podman container exec --user root $CONTAINER_NAME \
  /usr/sbin/usermod \
  --append --groups wheel \
  --home $USER_HOME \
  --shell /usr/bin/bash \
  $USER

echo "..You must set a password:"
podman container exec --interactive --tty --user root $CONTAINER_NAME \
  /usr/sbin/passwd $USER

echo "..Installing $USER command line"
podman container cp ./command-line-installers/ $CONTAINER_NAME:$USER_HOME/
podman container exec --user root $CONTAINER_NAME \
  chown --recursive $USER:$USER $USER_HOME
podman container exec \
  --user $USER \
  --workdir $USER_HOME/command-line-installers \
  $CONTAINER_NAME \
  ./1-command-line-setup.sh

echo "* Finished Run Container *"
echo ""
