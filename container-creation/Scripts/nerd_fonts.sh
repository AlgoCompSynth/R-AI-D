#! /usr/bin/env bash

set -e

mkdir --parents $HOME/.fonts
pushd /tmp > /dev/null
  rm --force --recursive nerd_fonts; mkdir nerd_fonts; cd nerd_fonts
  echo "..Downloading nerd font zipfile"
  curl -sOL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
  echo "..Unpacking nerd font zipfile"
  unzip -qqo CascadiaCode.zip
  echo "..Copying nerd font files to $HOME/.fonts"
  cp CaskaydiaCoveNerdFontMono-*.ttf $HOME/.fonts/
popd > /dev/null
