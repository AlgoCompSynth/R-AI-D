#! /usr/bin/env -S bash -l

set -e

echo "** Command Line Setup **"

source set-container-envars
mkdir --parents $LOCALBIN
mkdir --parents $LOGFILES
mkdir --parents $PROJECTS

export LOGFILE=$LOGFILES/command-line-setup.log
rm --force $LOGFILE

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

echo "** Finished Command Line Setup **"
echo ""
