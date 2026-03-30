#! /usr/bin/env bash

set -e

echo "** R AI Distrobox Base **"

# https://cran4linux.github.io/bspm/#ubuntu
echo "..Installing R and bspm"
. /etc/os-release # to get UBUNTU_CODENAME
URL="https://raw.githubusercontent.com/eddelbuettel/r2u/master/inst/scripts"
curl -s "${URL}/add_cranapt_${UBUNTU_CODENAME}.sh" | sudo bash -s

echo "..Installing r-base-dev"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y --no-install-recommends \
  alsa-utils \
  apt-file \
  bibtool \
  file \
  flac \
  gdebi-core \
  jq \
  libnspr4 \
  libnss3 \
  libsox-fmt-all \
  libsox3 \
  libsoxr0 \
  lsb-release \
  mp3splt \
  pmidi \
  qpdf \
  r-base-dev \
  sox \
  time \
  tree \
  vim-nox

echo "** Finished R AI Distrobox Base **"
echo ""
