#! /usr/bin/env bash

set -e

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Testing for nerd fonts"
if [[ "$(brew list | grep 'font-caskaydia-cove-nerd-font' | wc -l)" == "0" ]]
then
  echo "..Installing nerd fonts from Linuxbrew"
  #brew install --cask font-0xproto-nerd-font > /dev/null
  #brew install --cask font-blex-mono-nerd-font > /dev/null
  brew install --cask font-caskaydia-cove-nerd-font > /dev/null
  #brew install --cask font-caskaydia-mono-nerd-font > /dev/null
  #brew install --cask font-comic-shanns-mono-nerd-font > /dev/null
  #brew install --cask font-droid-sans-mono-nerd-font > /dev/null
  #brew install --cask font-fira-code-nerd-font > /dev/null
  #brew install --cask font-go-mono-nerd-font > /dev/null
  #brew install --cask font-jetbrains-mono-nerd-font > /dev/null
  #brew install --cask font-sauce-code-pro-nerd-font > /dev/null
  #brew install --cask font-ubuntu-nerd-font > /dev/null

  echo "..nerd fonts are installed"

else
  echo "..nerd fonts are installed"

fi
