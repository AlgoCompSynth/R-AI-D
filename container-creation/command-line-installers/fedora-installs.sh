#! /usr/bin/env -S bash -l

set -e

sudo dnf --quiet --assumeyes upgrade
sudo dnf --quiet --assumeyes copr enable iucar/cran
sudo dnf --quiet --assumeyes copr enable iucar/rstudio
sudo dnf --quiet --assumeyes install \
  R-CoprManager \
  R-devel \
  lshw \
  neovim \
  rstudio-desktop \
  zstd
