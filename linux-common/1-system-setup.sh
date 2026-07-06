#! /usr/bin/env -S bash -l

set -eu

echo "* System Setup *"

mkdir --parents $HOME/Logfiles

export LOGFILE=$HOME/Logfiles/system-setup.log
rm --force $LOGFILE

echo "..Setting $HOME/.Rprofile and $HOME/.Renviron"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron

for script in \
  r-developer-stack.sh \
  ollama.sh \
  goose.sh

do
  ./$script

done

echo "* Finished System Setup *"
echo ""
