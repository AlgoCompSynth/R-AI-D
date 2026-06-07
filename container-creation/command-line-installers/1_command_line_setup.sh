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
  aliases.sh \
  starship.sh \
  nerd_fonts.sh

do
  ./$script

done

if [[ "$(set | grep CONTAINER_ID | wc -l)" == "0" ]]
then
  exit

fi

for script in \
  ./projects.sh \
  ./nodejs.sh \
  ./rustup.sh \
  ./ollama.sh \
  ./agents.sh

do
  ./$script

done

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
