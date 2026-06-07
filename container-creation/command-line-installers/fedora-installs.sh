#! /usr/bin/env -S bash -l

set -e

sudo dnf --quiet --assumeyes upgrade
sudo dnf --quiet --assumeyes copr enable iucar/cran
sudo dnf --quiet --assumeyes copr enable iucar/rstudio
sudo dnf --quiet --assumeyes install \
  R-CoprManager \
  R-CRAN-Rdpack \
  R-CRAN-btw \
  R-CRAN-data.table \
  R-CRAN-devtools \
  R-CRAN-fractional \
  R-CRAN-numbers \
  R-CRAN-seewave \
  R-CRAN-tinytex \
  R-CRAN-tuneR \
  R-devel \
  libcurl-devel \
  lshw \
  neovim \
  rstudio-desktop \
  texlive-bibtools \
  zstd
