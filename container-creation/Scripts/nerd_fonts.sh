#! /usr/bin/env bash

set -e

mkdir --parents $HOME/.fonts
pushd /tmp > /dev/null
  rm --force --recursive nerd_fonts; mkdir nerd_fonts; cd nerd_fonts
  curl -sOL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
  unzip -qqo CascadiaCode.zip
  cp CaskaydiaCoveNerdFontMono-*.ttf $HOME/.fonts/
popd > /dev/null
