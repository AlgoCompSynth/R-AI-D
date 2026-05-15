#! /usr/bin/env bash

set -e

echo "** R AI Distrobox Base **"

./bspm.sh

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
  libpam-systemd \
  libsox-dev \
  libsox-fmt-all \
  libsoxr-dev \
  lsb-release \
  lshw \
  mp3splt \
  nvtop \
  pmidi \
  python3-apt \
  python3-dbus \
  python3-gi \
  qpdf \
  r-base-dev \
  sox \
  sudo \
  systemd \
  time \
  tree \
  vim-nox \
  wget \
  zstd

./rstudio-server.sh

apt-get clean

echo "** Finished R AI Distrobox Base **"
echo ""
