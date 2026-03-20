#! /usr/bin/env bash

set -e

echo "** Command Line Setup **"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/command_line_setup.log

if [[ "$(grep 'End AlgoCompSynth' .bashrc | wc -l)" == "0" ]]
then
  echo "..Adding 'aliases' to \$HOME/.bashrc"
  cat aliases >> $HOME/.bashrc
  source $HOME/.bashrc

  if [[ -f $HOME/.zshrc ]]
  then
    echo "..Adding 'aliases' to \$HOME/.zshrc"
    cat aliases >> $HOME/.zshrc

  fi

fi

echo "..Testing for Linuxbrew"
if [[ "$(which brew | wc -l)" == "0" ]]
then
  echo "..Installing Linuxbrew"
  /bin/bash -c \
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

else
  echo "..Linuxbrew is installed"

fi

echo "..Testing for starship"
if [[ "$(which starship | wc -l)" == "0" ]]
then
  echo "..Activating Linuxbrew"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  echo "..Installing starship from Linuxbrew"
  brew install starship \
    >> $LOGFILE 2>&1

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

else
  echo "..Starship is installed"

fi

echo "..Installing nerd fonts from Linuxbrew"
brew install --cask font-0xproto-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-blex-mono-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-caskaydia-cove-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-caskaydia-mono-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-comic-shanns-mono-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-droid-sans-mono-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-fira-code-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-go-mono-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-jetbrains-mono-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-sauce-code-pro-nerd-font >> $LOGFILE 2>&1 || true
brew install --cask font-ubuntu-nerd-font >> $LOGFILE 2>&1 || true

echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"

echo "** Finished Command Line Setup **"
echo ""
