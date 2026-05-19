#! /usr/bin/env bash

set -e

echo "** Command Line Setup **"

export LOGFILES=$HOME/Logfiles; mkdir --parents Logfiles
export LOGFILE=$LOGFILES/command_line_setup.log
rm --force $LOGFILE

for script in \
  "aliases.sh" \
  "starship.sh" \
  "nerd_fonts.sh"

do
  ./$script

done

echo "..Setting R dotfiles"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
