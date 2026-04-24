#! /usr/bin/env bash

set -e

echo "** Command Line Setup **"

source set_container_envars

export LOGFILE=$LOGFILES/command_line_setup.log
rm --force $LOGFILE

echo "Setting R dotfiles"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron

for script in \
  "aliases.sh" \
  "starship.sh" \
  "ollama.sh" \
  "coding_assistants.sh" \
  "nerd_fonts.sh"

do
  ./$script

done

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
