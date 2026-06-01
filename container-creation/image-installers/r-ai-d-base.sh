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
  apt-file \
  bash-completion \
  bibtool \
  curl \
  file \
  gdebi-core \
  gh \
  git \
  jq \
  language-pack-en \
  libbpf-dev \
  libnspr4 \
  libnss3 \
  libpam-systemd \
  lsb-release \
  lshw \
  man-db \
  neovim \
  net-tools \
  plocate \
  python3-apt \
  python3-dbus \
  python3-gi \
  qpdf \
  r-base-dev \
  ssh \
  sudo \
  systemd \
  tmux \
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

echo "..Installing BSPM" 1>&2
./bspm.sh

echo "..Updating packages" 1>&2
Rscript -e "update.packages(ask=FALSE)" 2> /dev/null

echo "..Installing devtools" 1>&2
Rscript -e "install.packages('devtools')" 2> /dev/null

echo "..Installing ROpenSci audio / video tools" 1>&2
Rscript -e "install.packages('av')" 2> /dev/null

echo "..Installing RStudio Server" 1>&2
./rstudio-server.sh

echo "..Configuring Secure Shell service" 1>&2
echo "Port 2222" | tee --append /etc/ssh/sshd_config
systemctl enable ssh.service

echo "** Finished R AI Distrobox Base **"
echo ""
