#! /usr/bin/env bash

set -e

sudo dnf --assumeyes upgrade
sudo dnf --assumeyes install \
  libcurl-devel \
  lshw \
  neovim \
  zstd

#https://cran4linux.github.io/bspm/#fedora
dnf --version | grep -q dnf5 || sudo dnf install 'dnf-command(copr)'
sudo dnf --assumeyes copr enable iucar/cran
sudo dnf --assumeyes install R-CoprManager
sudo dnf --assumeyes install R-devel

# https://copr.fedorainfracloud.org/coprs/iucar/rstudio/
sudo dnf --assumeyes copr enable iucar/rstudio # enables this repo
sudo dnf --assumeyes install rstudio-desktop   # for RStudio Desktop

./ai-packages.R
./audio-packages.R
./developer-packages.R
