#! /usr/bin/env bash

set -e

source set_container_envars

echo "** R AI Distrobox Base **"

if [[ "$(grep ubuntu /etc/passwd)" =~ "1000" ]]
then
  echo "..Removing 'ubuntu' user" 1>&2
  userdel --remove ubuntu 2> /dev/null
fi

if [[ "$(grep docker /etc/passwd)" =~ "1001" ]]
then
  echo "..Removing 'docker' user" 1>&2
  userdel --remove docker 2> /dev/null
fi

if [[ "$(grep rstudio /etc/passwd)" =~ "1002" ]]
then
  echo "..Removing 'rstudio' user" 1>&2
  userdel --remove rstudio 2> /dev/null
fi

echo "..Restoring man pages" 1>&2
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
  curl \
  file \
  gh \
  git \
  language-pack-en \
  libpam-systemd \
  lsb-release \
  lshw \
  man-db \
  neovim \
  net-tools \
  plocate \
  qpdf \
  r-base-dev \
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

echo "..Updating packages" 1>&2
Rscript -e "update.packages(ask=FALSE)" 2> /dev/null

echo "..Installing devtools" 1>&2
Rscript -e "install.packages('devtools')" 2> /dev/null

echo "..Installing ROpenSci audio / video tools" 1>&2
Rscript -e "install.packages(c('av', 'fluidsynth'))" 2> /dev/null

# https://schristiancollins.com/generaluser
Rscript -e "fluidsynth::soundfont_download()" 2> /dev/null

echo "** Finished R AI Distrobox Base **"
echo ""
