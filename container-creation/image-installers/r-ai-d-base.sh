#! /usr/bin/env bash

set -e

echo "** R AI Distrobox Base **"

echo "..Removing 'ubuntu' user"
userdel --remove ubuntu

echo "..Restoring documentation"
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get upgrade -qqy
apt-get install -qqy unminimize
echo "y" | unminimize

echo "..Installing base packages"
apt-get install -qqy --no-install-recommends \
  alsa-utils \
  apt-file \
  bash-completion \
  bibtool \
  curl \
  file \
  flac \
  gdebi-core \
  git \
  jq \
  libasound2-dev \
  libbpf-dev \
  libnspr4 \
  libnss3 \
  libpam-systemd \
  libsox-dev \
  libsox-fmt-all \
  libsoxr-dev \
  lsb-release \
  lshw \
  man-db \
  mp3splt \
  net-tools \
  nvtop \
  plocate \
  pmidi \
  python3-apt \
  python3-dbus \
  python3-gi \
  qpdf \
  r-base-dev \
  ssh \
  sox \
  sudo \
  systemd \
  time \
  tree \
  vim-nox \
  wget \
  zstd

./rstudio-server.sh
./bspm.sh

echo "..Configuring Secure Shell service"
echo "Port 2222" | tee --append /etc/ssh/sshd_config
systemctl enable ssh.service

echo "** Finished R AI Distrobox Base **"
echo ""
