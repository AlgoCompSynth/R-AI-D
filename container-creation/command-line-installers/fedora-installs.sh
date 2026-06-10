#! /usr/bin/env -S bash -l

set -e

sudo dnf --quiet --assumeyes upgrade
sudo dnf --quiet --assumeyes copr enable iucar/cran
sudo dnf --quiet --assumeyes copr enable iucar/rstudio
sudo dnf --quiet --assumeyes install \
  R-CoprManager \
  R-CRAN-GA \
  R-CRAN-Rdpack \
  R-CRAN-audio \
  R-CRAN-btw \
  R-CRAN-data.table \
  R-CRAN-devtools \
  R-CRAN-fractional \
  R-CRAN-monitoR \
  R-CRAN-music \
  R-CRAN-NatureSounds \
  R-CRAN-numbers \
  R-CRAN-phonTools \
  R-CRAN-seewave \
  R-CRAN-shinychat \
  R-CRAN-signal \
  R-CRAN-soundecology \
  R-CRAN-soundgen \
  R-CRAN-tinytex \
  R-CRAN-tuneR \
  R-CRAN-warbleR \
  R-devel \
  curl \
  firefox \
  libcurl-devel \
  lshw \
  neovim \
  rstudio-desktop \
  rstudio-server \
  texlive-bibtools \
  zstd

sudo systemctl enable --now rstudio-server.service

sudo Rscript -e "install.packages('fluidsynth', repos ='https://cloud.r-project.org/')"
