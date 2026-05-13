#! /usr/bin/env bash

set -e

echo "** R AI Distrobox Base **"

echo "..Setting up BSPM"
# https://cran4linux.github.io/bspm/#ubuntu
. /etc/os-release # to get UBUNTU_CODENAME
URL="https://raw.githubusercontent.com/eddelbuettel/r2u/master/inst/scripts"
curl -s "${URL}/add_cranapt_${UBUNTU_CODENAME}.sh" | sudo bash -s

echo "..Installing base packages"
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get upgrade -qqy
apt-get install -qqy --no-install-recommends \
  alsa-utils \
  apt-file \
  bibtool \
  curl \
  file \
  flac \
  gdebi-core \
  git \
  jq \
  libasound2-dev \
  libnspr4 \
  libnss3 \
  libsox-dev \
  libsox-fmt-all \
  libsoxr-dev \
  lsb-release \
  lshw \
  mp3splt \
  pmidi \
  python3-apt \
  python3-dbus \
  python3-gi \
  qpdf \
  r-base-dev \
  sox \
  sudo \
  time \
  tree \
  vim-nox \
  wget \
  zstd

echo "..Installing and configuing BSPM"
Rscript -e 'install.packages("bspm", repos="https://cran.r-project.org")'
echo "bspm::enable()" | sudo tee -a /etc/R/Rprofile.site

echo "** Finished R AI Distrobox Base **"
echo ""


