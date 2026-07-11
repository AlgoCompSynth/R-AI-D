#! /usr/bin/env bash

echo "* Re-create Distrobox *"

source set-host-envars

echo "..Creating $HOST_MODEL_PERSISTENCE if needed"
mkdir --parents $HOST_MODEL_PERSISTENCE

echo "..Re-creating $CONTAINER_NAME"
distrobox assemble create \
  --name $CONTAINER_NAME

echo "..Copying 'agent-installers' into $CONTAINER_HOME"
cp -rp agent-installers $CONTAINER_HOME

echo "..Copying 'model-pullers' into $CONTAINER_HOME"
cp -rp model-pullers $CONTAINER_HOME

echo "..Copying 'populate-container' into $CONTAINER_HOME"
cp -rp populate-container $CONTAINER_HOME

echo "..Populating container"
pushd $CONTAINER_HOME/populate-container/
  distrobox enter $CONTAINER_NAME -- ./1-system-setup.sh
popd

mkdir --parents $HOME/.local/bin
export ENTRY_SCRIPT=$HOME/.local/bin/$CONTAINER_NAME
echo "..Creating command line entry script $ENTRY_SCRIPT"
echo \
  "distrobox enter $CONTAINER_NAME -- sudo systemctl enable --now ollama.service" \
  > $ENTRY_SCRIPT

echo \
  "distrobox enter $CONTAINER_NAME" \
  >> $ENTRY_SCRIPT
chmod +x $ENTRY_SCRIPT

echo "* Finished Re-create Distrobox *"
echo ""
