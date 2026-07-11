#! /usr/bin/env -S bash -l

set -e

echo ""
echo "*** R Developer Stack ***"

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
