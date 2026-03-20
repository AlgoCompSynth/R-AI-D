#! /usr/bin/env bash

set -e

echo "..Activating Linuxbrew"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "..Testing for starship"
if [[ "$(which starship | wc -l)" == "0" ]]
then

  echo "..Installing starship from Linuxbrew"
  brew install starship > $LOGFILE

  echo "..Setting starship configuration file"
  mkdir --parents $HOME/.config
  cp starship.toml $HOME/.config/starship.toml

  if [[ "$(grep starship $HOME/.bashrc | wc -l)" == 0 ]]
  then
    echo "..Appending starship init to $HOME/.bashrc"
    echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

  fi

  if [[ -f $HOME/.zshrc && "$(grep starship $HOME/.zshrc | wc -l)" == 0 ]]
  then
    echo "..Appending starship init to $HOME/.zshrc"
    echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc

  fi

  echo "..Starship is installed"

else
  echo "..Starship is installed"

fi
