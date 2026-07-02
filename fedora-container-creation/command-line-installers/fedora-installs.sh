#! /usr/bin/env -S bash -l

set -e

echo "** Fedora Installs **"

source set-container-envars
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/fedora-installs.log
rm --force $LOGFILE

echo "..Upgrading"
sudo dnf --assumeyes upgrade \
  >> $LOGFILE 2>&1

echo "..Enabling COPRs"
sudo dnf --assumeyes copr enable iucar/cran \
  >> $LOGFILE 2>&1
sudo dnf --assumeyes copr enable iucar/rstudio \
  >> $LOGFILE 2>&1

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
  firefox \
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
  >> $LOGFILE 2>&1
echo "..Main install finished"

echo "..Setting R browser to firefox sitewide"
echo "options(browser='firefox')" | sudo tee /usr/lib64/R/etc/Rprofile.site.d/60-Firefox.site

echo "..Copying R / btw settings files to $HOME"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron
cp btw.md $HOME/btw.md

echo "..Backup plan if iucar/CRAN COPR isn't available"
sudo ./R-installs.R \
  >> $LOGFILE 2>&1

echo "..Installing 'eikosany' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/eikosany', dependencies = TRUE, build_vignettes = TRUE)" \
  > /dev/null 2>&1

echo "..Installing 'consonaR' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/consonaR', dependencies = TRUE, build_vignettes = TRUE)" \
  > /dev/null 2>&1

echo "..Enabling RStudio Server"
sudo systemctl enable --now rstudio-server.service

echo "** Finished Fedora Installs **"
echo ""
