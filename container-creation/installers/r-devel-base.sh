#! /usr/bin/env bash

set -e

echo "** R Development Base **"

source set_envars

echo "..Installing R and bspm"
. /etc/os-release # to get UBUNTU_CODENAME
URL="https://raw.githubusercontent.com/eddelbuettel/r2u/master/inst/scripts"
curl -s "${URL}/add_cranapt_${UBUNTU_CODENAME}.sh" | sudo bash -s

echo "..Installing r-base-dev"
sudo apt-get install -y --no-install-recommends \
  apt-file \
  bibtool \
  qpdf \
  r-base-dev \
  vim-nox

echo "** Finished Development Base **"
echo ""
