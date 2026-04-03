#! /usr/bin/env bash

set -e

echo "** R AI Distrobox Base **"

echo "..Installing base packages"
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get upgrade -qqy
apt-get install -qqy --no-install-recommends \
  alsa-utils \
  apt-file \
  bibtool \
  curl \
  faust \
  faustworks \
  file \
  flac \
  gdebi-core \
  git \
  jq \
  libfaust-static \
  libnspr4 \
  libnss3 \
  libsox-fmt-all \
  libsox3 \
  libsoxr0 \
  lsb-release \
  lshw \
  mp3splt \
  pmidi \
  qpdf \
  sox \
  sudo \
  time \
  tree \
  vim-nox \
  wget \
  zstd

echo "** Finished R AI Distrobox Base **"
echo ""
