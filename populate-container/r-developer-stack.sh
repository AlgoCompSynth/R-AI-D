#! /usr/bin/env -S bash -l

set -e

echo ""
echo "*** R Developer Stack ***"

echo "..Upgrading"
sudo dnf --assumeyes upgrade \
  >> $LOGFILE 2>&1

echo "..Enabling COPRs"
sudo dnf --assumeyes copr enable iucar/cran \
  >> $LOGFILE 2>&1
sudo dnf --assumeyes copr enable iucar/rstudio \
  >> $LOGFILE 2>&1

echo "..Installing RPMs"
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
  fftw-devel \
  fluidsynth-devel \
  fontconfig-devel \
  freetype-devel \
  fribidi-devel \
  gh \
  git-lfs \
  harfbuzz-devel \
  libavfilter-free-devel \
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
  rstudio-desktop \
  rustc \
  vim-enhanced \
  zstd \
  >> $LOGFILE 2>&1
echo "..RPM install finished"

echo "..Updating / installing R packages"
sudo ./R-installs.R \
  >> $LOGFILE 2>&1
echo "..R package install finished"

echo "..Installing 'eikosany' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/eikosany', dependencies = TRUE, build_vignettes = TRUE)" \
  >> $LOGFILE 2>&1

echo "..Installing 'consonaR' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/consonaR', dependencies = TRUE, build_vignettes = TRUE)" \
  >> $LOGFILE 2>&1

echo "*** Finished R Developer Stack ***"
echo ""
