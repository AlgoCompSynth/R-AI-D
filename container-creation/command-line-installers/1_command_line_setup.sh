#! /usr/bin/env -S bash -l

set -e

echo "** Command Line Setup **"

source set_container_envars
mkdir --parents $LOCALBIN
mkdir --parents $LOGFILES
mkdir --parents $PROJECTS

export LOGFILE=$LOGFILES/command_line_setup.log
rm --force $LOGFILE

for script in \
  "aliases.sh" \
  "starship.sh" \
  "nerd_fonts.sh"

do
  ./$script

done

echo "..Testing for container install"
if [[ "$(set | grep CONTAINER_ID | wc -l)" != "0" ]]
then
  echo "..Running in container" 1>&2
  echo "..Setting R dotfiles" 1>&2
  cp Rprofile $HOME/.Rprofile
  cp Renviron $HOME/.Renviron
  ./nodejs.sh
  ./ollama.sh
  ./skills.sh
  ./opencode.sh
  ./pi-coding-agent.sh
  ./goose.sh

fi

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
