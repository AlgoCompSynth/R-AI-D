#! /usr/bin/env -S bash -l

set -eu
source set-envars

echo "* System Setup *"
mkdir --parents $LOCALBIN
mkdir --parents $LOGFILES
mkdir --parents $PROJECTS

export LOGFILE=$LOGFILES/command-line-setup.log
rm --force $LOGFILE

echo "..Copying R settings files to $HOME"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron

sudo ./r-development-stack.sh

for script in \
  ./aliases.sh \
  ./starship.sh \
  ./nerd-fonts.sh \
  ./nodejs.sh \
  ./rustup.sh \
  ./ollama.sh \
  ./agents.sh

do
  ./$script

done

echo "..Copying model pullers to $HOME/.local/bin"
mkdir --parents $HOME/.local/bin
cp pull-*.sh $HOME/.local/bin

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "* Finished System Setup *"
echo ""
