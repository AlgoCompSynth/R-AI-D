#! /usr/bin/env bash

set -eu
source set-envars
export LOGFILE=/tmp/r-development-stack.log
rm --force $LOGFILE

## From https://github.com/eddelbuettel/r2u/blob/master/inst/scripts/add_cranapt_noble.sh
## Modified 2026-06-29 znmeb@algocompsynth.net

## 1. Change some comments to "echo"
## 2. Change "apt" to "apt-get" to get rid of warnings
## 3. Moved DEBIAN_FRONTEND declaration to beginning
## 4. Install r-base-dev instead of r-base-core
## 5. Update packages and add devtools
## 6. Add RStudio Server

## See the README.md of 'r2u' for details on these steps
##
## This script has been tested on a plain and minimal ubuntu:24.04
##
## On a well-connected machine this script should take well under one minute
##
## Note that you need to run this as root, or run the whole script via sudo
## To run individual commands as root, prefix each command with sudo and use
## 'echo | sudo tee file' as the command before the EOF redirect statement

echo "** R development stack **"

export DEBIAN_FRONTEND=noninteractive

echo "..install dependencies and get keys"
apt-get update -qq >> $LOGFILE \
  && apt-get install -qqy --no-install-recommends \
  alsa-utils \
  bibtool \
  ca-certificates \
  cmake \
  curl \
  gdebi-core \
  gh \
  gnupg \
  lshw \
  neovim \
  qpdf \
  zstd >> $LOGFILE

## use gpg directly instead of the now-deprecated apt-key command
gpg --homedir /tmp \
  --no-default-keyring \
  --keyring /usr/share/keyrings/r2u.gpg \
  --keyserver keyserver.ubuntu.com \
  --recv-keys A1489FE2AB99A21A 67C2D66C4B1D4339 51716619E084DAB9 >> $LOGFILE

echo "..add the r2u repo"
cat > /etc/apt/sources.list.d/r2u.sources <<EOF
Types: deb
URIs: https://r2u.stat.illinois.edu/ubuntu
Suites: noble
Components: main
Arch: amd64, arm64
Signed-By: /usr/share/keyrings/r2u.gpg
EOF

echo "..ensure current R is used"
cat > /etc/apt/sources.list.d/cran.sources <<EOF
Types: deb
URIs: https://cloud.r-project.org/bin/linux/ubuntu
Suites: noble-cran40/
Components:
Arch: amd64, arm64
Signed-By: /usr/share/keyrings/r2u.gpg
EOF
apt-get update -qq >> $LOGFILE
apt-get install -qqy --no-install-recommends r-base-dev >> $LOGFILE

echo "..add pinning to ensure package sorting"
cat > /etc/apt/preferences.d/99cranapt <<EOF
Package: *
Pin: release o=CRAN-Apt Project
Pin: release l=CRAN-Apt Packages
Pin-Priority: 700
EOF

echo "..install/enable bspm"
## If needed (in bare container, say) install python tools for bspm and R itself
apt-get install -qqy --no-install-recommends python3-{dbus,gi,apt} make >> $LOGFILE
## Then install bspm (as root) and enable it, and enable a speed optimization
Rscript -e 'install.packages("bspm")' >> $LOGFILE
cat >> /etc/R/Rprofile.site <<EOF
suppressMessages(bspm::enable())
options(bspm.version.check=FALSE)
EOF

echo "..update packages"
Rscript -e 'update.packages(ask=FALSE)' >> $LOGFILE

echo "..install eikosany and consonaR dependencies"
./R-installs.R >> $LOGFILE

echo "..install RStudio Server"
pushd /tmp
  rm --force *.deb
  wget --quiet $RSTUDIO_URL
  gdebi -n -q $RSTUDIO_PACKAGE >> $LOGFILE

popd

echo "** Finished R development stack **"
echo ""
