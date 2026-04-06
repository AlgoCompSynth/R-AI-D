#! /usr/bin/env bash

set -e

pushd ../container-creation/Scripts/ > /dev/null
  ./1_command_line_setup.sh

popd > /dev/null

pushd /tmp > /dev/null
  rm --force --recursive distrobox
  echo "..Cloning Distrobox source"
  git clone --quiet \
    https://github.com/89luca89/distrobox.git
  cd distrobox
  git checkout $DISTROBOX_VERSION

  echo "..Installing distrobox to $HOME/.local/bin"
  ./install
  echo "..which distrobox: $(which distrobox)"
  echo "..distrobox --version: $(distrobox --version)"

popd > /dev/null
