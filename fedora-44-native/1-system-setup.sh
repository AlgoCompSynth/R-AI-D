#! /usr/bin/env -S bash -l

set -eu

echo "* System Setup *"

mkdir --parents $HOME/Projects
mkdir --parents $HOME/Logfiles
mkdir --parents $HOME/.local/bin

export LOGFILE=$HOME/Logfiles/system-setup.log
rm --force $LOGFILE

echo "..Setting $HOME/.Rprofile and $HOME/.Renviron"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron

for script in \
  aliases.sh \
  starship.sh \
  nerd-fonts.sh \
  rustup.sh \
  r-developer-stack.sh \
  ollama.sh \
  goose.sh

do
  ./$script

done

echo "..Copying model pullers to $HOME/.local/bin"
cp pull-*.sh $HOME/.local/bin

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "* Finished System Setup *"
echo ""
