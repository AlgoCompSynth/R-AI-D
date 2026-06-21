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
  R-CoprManager \
  R-CRAN-DBI \
  R-CRAN-GA \
  R-CRAN-Rdpack \
  R-CRAN-audio \
  R-CRAN-btw \
  R-CRAN-data.table \
  R-CRAN-devtools \
  R-CRAN-diffviewer \
  R-CRAN-duckdb \
  R-CRAN-fractional \
  R-CRAN-monitoR \
  R-CRAN-music \
  R-CRAN-NatureSounds \
  R-CRAN-numbers \
  R-CRAN-ollamar \
  R-CRAN-phonTools \
  R-CRAN-remotes \
  R-CRAN-rstudiothemes \
  R-CRAN-seewave \
  R-CRAN-shinychat \
  R-CRAN-signal \
  R-CRAN-soundecology \
  R-CRAN-soundgen \
  R-CRAN-tinytex \
  R-CRAN-tuneR \
  R-CRAN-warbleR \
  R-devel \
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
  >> $LOGFILE 2>&1
echo "..Main install finished"

echo "..Setting R browser to firefox sitewide"
echo "options(browser='firefox')" | sudo tee /usr/lib64/R/etc/Rprofile.site.d/60-Firefox.site

echo "..Linking distrobox-host-exec to container firefox"
sudo ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/firefox

echo "..Backup plan if iucar/CRAN COPR isn't available"
sudo ./R-installs.R \
  >> $LOGFILE 2>&1

echo "..Copying R / btw settings files to $HOME"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron
cp btw.md $HOME/btw.md

echo "..Enabling RStudio Server"
sudo systemctl enable --now rstudio-server.service

echo "..Installing 'eikosany' from GitHub"
sudo Rscript -e \
  "devtools::install_github('AlgoCompSynth/eikosany', dependencies = TRUE, build_vignettes = TRUE)" \
  > /dev/null

echo "** Finished Fedora Installs **"
echo ""
