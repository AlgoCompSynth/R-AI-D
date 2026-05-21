#! /usr/bin/env bash

set -e

source set_container_envars

echo "** R AI Distrobox Base **"

if [[ "$(grep ubuntu /etc/passwd)" =~ "1000" ]]
then
  echo "..Removing 'ubuntu' user" 1>&2
  userdel --remove ubuntu 2> /dev/null
fi

echo "..Restoring documentation" 1>&2
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get upgrade -qqy
apt-get install -qqy time unminimize
echo "y" | unminimize

echo "..Installing base packages" 1>&2
apt-get install -qqy --no-install-recommends \
  alsa-utils \
  apt-file \
  bash-completion \
  bibtool \
  byobu \
  chuck \
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

echo "..Installing RStudio Server" 1>&2
./rstudio-server.sh

echo "..Installing BSPM" 1>&2
./bspm.sh

echo "..Configuring Secure Shell service" 1>&2
echo "Port 2222" | tee --append /etc/ssh/sshd_config
systemctl enable ssh.service

echo "** Finished R AI Distrobox Base **"
echo ""
