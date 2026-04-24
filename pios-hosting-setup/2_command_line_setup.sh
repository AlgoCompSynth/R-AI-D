#! /usr/bin/env bash

set -e

echo "** Distrobox **"
pushd /tmp > /dev/null
  rm --force --recursive distrobox
  echo "..Cloning Distrobox source"
  git clone --quiet \
    https://github.com/89luca89/distrobox.git
  cd distrobox

  echo "..Installing distrobox to $HOME/.local/bin"
  mkdir --parents $HOME/.local/bin

  if [[ ! "$PATH" =~ "$HOME/.local/bin" ]]
  then
    export PATH=$HOME/.local/bin:$PATH

  fi

  ./install
  echo "..which distrobox: $(which distrobox)"
  echo "..distrobox --version: $(distrobox --version)"

echo "** Finished Distrobox **"
echo ""

popd > /dev/null

pushd ../container-creation/command-line-installers/ > /dev/null
  ./1_command_line_setup.sh

popd > /dev/null
