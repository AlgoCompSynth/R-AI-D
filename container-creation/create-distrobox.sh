#! /usr/bin/env bash

echo "* Create Distrobox *"

source set_container_envars

# Why do we change the domain nameservers? The code for
# installing the bridge to system package manager (bspm)
# accesses a Ubuntu keyserver, and the DNS my ISP provides
# does not appear to handle that correctly. Using CloudFlare
# or Google nameservers works, so here they are.
echo "Building $DBX_CONTAINER_IMAGE"
if [[ "$COMPUTE_MODE" == "CPU" ]]
then
  echo "Building CPU image"
  podman image build \
    --dns 1.1.1.1 \
    --dns 1.0.0.1 \
    --dns 8.8.8.8 \
    --file $CONTAINERFILE \
    --tag $DBX_CONTAINER_IMAGE \
    --squash-all \
    .

else

  echo "Building NVIDIA GPU image"
  podman image build \
    --security-opt=label=disable \
    --device=nvidia.com/gpu=all \
    --dns 1.1.1.1 \
    --dns 1.0.0.1 \
    --dns 8.8.8.8 \
    --file $CONTAINERFILE \
    --tag $DBX_CONTAINER_IMAGE \
    --squash-all \
    .

fi

echo ""
podman system prune --force
echo ""
podman image list

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
if [[ "$COMPUTE_MODE" == "CPU" ]]
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

echo "Setting up container desktop and command line"
pushd Scripts
  distrobox enter $DBX_CONTAINER_NAME -- sudo chown --recursive ollama:ollama $OLLAMA_MODELS_CONTAINER
  distrobox enter $DBX_CONTAINER_NAME -- sudo usermod --append --groups ollama $USER
  distrobox enter $DBX_CONTAINER_NAME -- su $USER -c "./1_command_line_setup.sh"
popd

distrobox list

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

echo ""
podman image list --all
echo ""
podman container list --all
echo ""

echo "* Finished Create Distrobox *"
echo ""
