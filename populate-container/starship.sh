#! /usr/bin/env -S bash -l

set -eu

echo "..Setting starship configuration file" 1>&2
mkdir --parents $HOME/.config
cp starship.toml $HOME/.config/starship.toml

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

echo "..Starship is configured" 1>&2
