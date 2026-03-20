#! /usr/bin/env bash

set -e

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# As you can see, there are a number of nerd fonts available in Linuxbrew.
# I picked this one because it's non-nerd ancestor is one of the fonts that
# ships with RStudio and it has the ligatures.
echo "..Testing for nerd fonts"
if [[ "$(brew list | grep 'font-caskaydia-cove-nerd-font' | wc -l)" == "0" ]]
then
  echo "..Installing nerd fonts from Linuxbrew"
  #brew install --cask font-0xproto-nerd-font > $LOGFILE
  #brew install --cask font-blex-mono-nerd-font > $LOGFILE
  brew install --cask font-caskaydia-cove-nerd-font > $LOGFILE
  #brew install --cask font-caskaydia-mono-nerd-font > $LOGFILE
  #brew install --cask font-comic-shanns-mono-nerd-font > $LOGFILE
  #brew install --cask font-droid-sans-mono-nerd-font > $LOGFILE
  #brew install --cask font-fira-code-nerd-font > $LOGFILE
  #brew install --cask font-go-mono-nerd-font > $LOGFILE
  #brew install --cask font-jetbrains-mono-nerd-font > $LOGFILE
  #brew install --cask font-sauce-code-pro-nerd-font > $LOGFILE
  #brew install --cask font-ubuntu-nerd-font > $LOGFILE

  echo "..nerd fonts are installed"

else
  echo "..nerd fonts are installed"

fi
