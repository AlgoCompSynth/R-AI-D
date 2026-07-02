#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

echo "..Setting starship configuration file" 1>&2
mkdir --parents $HOME/.config
cp starship.toml $HOME/.config/starship.toml

echo "..Installing starship with official installer" 1>&2
# https://starship.rs/guide/#%F0%9F%9A%80-installation
pushd /tmp > /dev/null
  export BIN_DIR=$HOME/.local/bin
  mkdir --parents $BIN_DIR
  rm --force install.sh
  curl --silent --show-error --remote-name https://starship.rs/install.sh
  chmod +x install.sh
  ./install.sh --yes > /dev/null 2>&1
popd > /dev/null

if [[ "$(grep starship $HOME/.bashrc | wc -l)" == 0 ]]
then
  echo "..Appending starship init to $HOME/.bashrc" 1>&2
  echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

fi

if [[ -f $HOME/.zshrc && "$(grep starship $HOME/.zshrc | wc -l)" == 0 ]]
then
  echo "..Appending starship init to $HOME/.zshrc" 1>&2
  echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc

fi

echo "..Starship is installed" 1>&2
