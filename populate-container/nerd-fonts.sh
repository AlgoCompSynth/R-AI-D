#! /usr/bin/env -S bash -l

set -eu

mkdir --parents $HOME/.fonts
pushd /tmp > /dev/null
  rm --force --recursive nerd_fonts; mkdir nerd_fonts; cd nerd_fonts

  echo "..Downloading nerd font zipfile"
  curl -sOL \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip

  echo "..Unpacking nerd font zipfile"
  unzip -qqo FiraCode.zip

  echo "..Copying nerd font files to $HOME/.fonts"
  mkdir --parents $HOME/.fonts
  cp *.ttf $HOME/.fonts/

  echo "..Copying nerd font files to $HOME/.local/share/fonts/"
  mkdir --parents $HOME/.local/share/fonts
  cp *.ttf $HOME/.local/share/fonts/

  echo "..Copying nerd font files to $HOME/.config/rstudio/fonts/"
  mkdir --parents $HOME/.config/rstudio/fonts
  cp *.ttf $HOME/.config/rstudio/fonts/

popd > /dev/null

echo "..Copying config.ghostty to $HOME/.config/ghostty/"
mkdir --parents $HOME/.config/ghostty
cp config.ghostty $HOME/.config/ghostty/
