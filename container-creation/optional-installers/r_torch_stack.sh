#! /usr/bin/env bash

set -e

echo "** R Torch stack **"

source set_container_envars
export LOGFILE=$LOGFILES/r_torch_stack_log
rm --force $LOGFILE

# https://cran.r-project.org/web/packages/torch/vignettes/installation.html
if [[ "$COMPUTE_MODE" == "CUDA" ]]
then
  echo "..Installing CUDA 12.8"
  # https://docs.nvidia.com/cuda/
  export DEBIAN_FRONTEND=noninteractive
  pushd /tmp > /dev/null
    rm --force *.deb
    wget --quiet \
      https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
    sudo dpkg -i cuda-keyring_1.1-1_all.deb \
      >> $LOGFILE 2>&1
    sudo apt-get update \
      >> $LOGFILE 2>&1
    /usr/bin/time sudo apt-get -y install cuda-toolkit-12-8 \
      >> $LOGFILE 2>&1

    echo "..Installing CUDNN 9"
    # https://developer.nvidia.com/cudnn
    /usr/bin/time sudo apt-get -y install cudnn9-cuda-12 \
      >> $LOGFILE 2>&1

    echo "..Cleanup"
    rm --force *.deb

  popd > /dev/null

fi

echo "..Installing R torch library packages"
/usr/bin/time sudo ./torch-packages.R \
  >> $LOGFILE 2>&1

echo "** Finished R Torch stack **"
echo ""
