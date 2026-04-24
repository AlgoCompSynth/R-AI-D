#! /usr/bin/env bash

set -e

echo "** CUDA **"

echo "..Installing CUDA 12.9"
# This is only required for running the R 'torch' library package
# in an NVIDIA GPU. See
#
# https://cran.r-project.org/web/packages/torch/vignettes/installation.html
# https://docs.nvidia.com/cuda/
# https://developer.nvidia.com/cudnn

source set_container_envars
if [[ "$COMPUTE_MODE" != "CUDA" ]]
then
  echo "No GPU"
  exit

fi

export DEBIAN_FRONTEND=noninteractive
wget --quiet \
  https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt-get update
apt-get -y install cuda-toolkit-12-8
apt-get -y install cudnn9-cuda-12

echo "** Finished CUDA **"
echo ""
