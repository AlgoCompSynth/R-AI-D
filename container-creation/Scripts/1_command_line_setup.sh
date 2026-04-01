#! /usr/bin/env bash

set -e

echo "** Command Line Setup **"

source set_script_envars

echo "Setting up desktop directories"
mkdir --parents $LOCALBIN $LOGFILES $PROJECTS $SCRIPTS
cp * $HOME/Scripts

echo "Testing for container install"
if [[ "$(set | grep CONTAINER_ID | wc -l)" != "0" ]]
then
  echo "..Running in a container - copying model scripts to $LOCALBIN"
  cp *_models.sh $LOCALBIN/

fi

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/command_line_setup.log
rm --force $LOGFILE

echo "Setting R dotfiles"
cp $HOME/Scripts/Rprofile $HOME/.Rprofile
cp $HOME/Scripts/Renviron $HOME/.Renviron

pushd $HOME/Scripts
  for script in \
    "linuxbrew.sh" \
    "starship.sh" \
    "coding-assistants.sh" \
    "nerd-fonts.sh"

  do
    ./$script

  done

popd

if [[ "$(grep R-AI-D_aliases $HOME/.bashrc | wc -l)" == "0" ]]
then
  echo "..Appending R-AI-D_aliases to $HOME/.bashrc"
  cat R-AI-D_aliases >> $HOME/.bashrc
fi

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
