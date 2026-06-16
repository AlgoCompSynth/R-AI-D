#! /usr/bin/env bash

set -e

mkdir --parents $HOME/Projects
pushd $HOME/Projects
  rm --force --recursive distrobox
  git clone https://github.com/89luca89/distrobox.git
  cd distrobox
  ./install

popd

hash -r
which distrobox
distrobox --version
