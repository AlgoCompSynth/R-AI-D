#! /usr/bin/env -S bash -l

set -e

echo "** R Developer Stack **"

echo "..Upgrading"
sudo dnf --assumeyes upgrade \
  >> $LOGFILE

echo "..Enabling COPRs"
sudo dnf --assumeyes copr enable iucar/cran \
  >> $LOGFILE
sudo dnf --assumeyes copr enable iucar/rstudio \
  >> $LOGFILE

echo "..Installing"
sudo dnf --assumeyes install --skip-unavailable \
  BibTool \
  R \
  R-CoprManager \
  R-CRAN-Rdpack \
  R-CRAN-bslib \
  R-CRAN-btw \
  R-CRAN-data.table \
  R-CRAN-devtools \
  R-CRAN-duckdb \
  R-CRAN-ellmer \
  R-CRAN-fractional \
  R-CRAN-kintr \
  R-CRAN-markdown \
  R-CRAN-numbers \
  R-CRAN-ollamar \
  R-CRAN-pkgdown \
  R-CRAN-quarto \
  R-CRAN-remotes \
  R-CRAN-rmarkdown \
  R-CRAN-shiny \
  R-CRAN-shinychat \
  R-CRAN-testthat \
  R-CRAN-tinytex \
  R-CRAN-tuneR \
  R-CRAN-withr \
  alsa-utils \
  cargo \
  cmake \
  curl \
  ffmpeg-devel \
  fftw-devel \
  fluidsynth-devel \
  fontconfig-devel \
  freetype-devel \
  fribidi-devel \
  gh \
  git-lfs \
  harfbuzz-devel \
  libcurl-devel \
  libgit2-devel \
  libjpeg-devel \
  libpng-devel \
  libsndfile-devel \
  libtiff-devel \
  libuv-devel \
  libwebp-devel \
  libxml2-devel \
  lshw \
  neovim \
  nvtop \
  rstudio-server \
  rustc \
  zstd \
  >> $LOGFILE
echo "..Main install finished"

echo "..Backup plan if iucar/CRAN COPR isn't available"
sudo ./R-installs.R \
  >> $LOGFILE

echo "..Installing 'eikosany' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/eikosany', dependencies = TRUE, build_vignettes = TRUE)" \
  >> $LOGFILE

echo "..Installing 'consonaR' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/consonaR', dependencies = TRUE, build_vignettes = TRUE)" \
  >> $LOGFILE

echo "..Enabling RStudio Server"
sudo systemctl enable --now rstudio-server.service

echo "** Finished R Developer Stack **"
echo ""
