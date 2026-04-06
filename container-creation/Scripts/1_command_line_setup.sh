#! /usr/bin/env bash

set -e

echo "** Command Line Setup **"

source set_script_envars

echo "Setting up desktop directories"
mkdir --parents $LOCALBIN $LOGFILES $PROJECTS $SCRIPTS
cp * $HOME/Scripts

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/command_line_setup.log
rm --force $LOGFILE

echo "Setting R dotfiles"
cp $HOME/Scripts/Rprofile $HOME/.Rprofile
cp $HOME/Scripts/Renviron $HOME/.Renviron

pushd $HOME/Scripts
  for script in \
    "aliases.sh" \
    "starship.sh" \
    "coding_assistants.sh" \
    "nerd_fonts.sh"

  do
    ./$script

  done

popd

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
