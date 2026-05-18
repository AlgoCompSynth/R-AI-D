#! /usr/bin/env bash

set -e

source set_container_envars

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
  byobu \
  curl \
  faust \
  file \
  flac \
  gdebi-core \
  git \
  jq \
  language-pack-en \
  libasound2-dev \
  libbpf-dev \
  libfaust-static \
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
  neovim \
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
  wget \
  zstd

# We only install the English language pack and set the locale to en_US.UTF-8.
# If you need others, see 
#
# https://wiki.ubuntu.com/UbuntuDevelopment/Internationalisation/InternationalizationPrimer/Locales
#
echo "..'update-locale LANG=en_US.UTF-8'"
update-locale LANG=en_US.UTF-8

if [[ "$COMPUTE_MODE" == "CUDA" ]]
then
  echo ""
  nvidia-smi
  echo ""

fi

./rstudio-server.sh
./bspm.sh

echo "..Configuring Secure Shell service"
echo "Port 2222" | tee --append /etc/ssh/sshd_config
systemctl enable ssh.service

echo "** Finished R AI Distrobox Base **"
echo ""
