#! /usr/bin/env bash

set -e

echo "..Testing for Linuxbrew"
if [[ "$(which brew | wc -l)" == "0" ]]
then
  echo "..Installing Linuxbrew"
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "..Adding brew activation to $HOME/.bashrc"
  echo >> $HOME/.bashrc
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bashrc

  if [[ -f $HOME/.zshrc && "$(grep linuxbrew $HOME/.zshrc | wc -l)" == "0" ]]
  then
    echo "..Adding brew activation to $HOME/.zshrc"
    echo >> $HOME/.zshrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zshrc

  fi

  echo "..Linuxbrew is installed"

else
  echo "..Linuxbrew is installed"

fi
