#! /usr/bin/env bash

set -e

echo "..Setting up BSPM"
# https://cran4linux.github.io/bspm/#ubuntu
. /etc/os-release # to get UBUNTU_CODENAME
URL="https://raw.githubusercontent.com/eddelbuettel/r2u/master/inst/scripts"
curl -s "${URL}/add_cranapt_${UBUNTU_CODENAME}.sh" | sudo bash -s > /dev/null 2>&1

echo "..Installing and configuing BSPM"
Rscript -e 'install.packages("bspm", repos="https://cran.r-project.org")'
echo "bspm::enable()" | tee --append /etc/R/Rprofile.site
