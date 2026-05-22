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
  mkdir --parents $HOME/.fonts
  cp CaskaydiaCoveNerdFontMono-Regular.ttf $HOME/.fonts/
  echo "..Copying nerd font files to $HOME/.local/share/fonts/"
  mkdir --parents $HOME/.local/share/fonts
  cp CaskaydiaCoveNerdFontMono-Regular.ttf $HOME/.local/share/fonts/

  if [[ -f "/etc/rstudio/fonts/README.md" ]]
  then
    echo "..Copying nerd font files to $HOME/.config/rstudio/fonts/"
    mkdir --parents $HOME/.config/rstudio/fonts
    cp CaskaydiaCoveNerdFontMono-Regular.ttf $HOME/.config/rstudio/fonts/


  fi

popd > /dev/null
