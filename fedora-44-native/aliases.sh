#! /usr/bin/env -S bash -l

set -eu

if [[ "$(grep R-AI-D-aliases $HOME/.bashrc | wc -l)" == "0" ]]
then
  echo "..Appending R-AI-D-aliases to $HOME/.bashrc" 1>&2
  cat R-AI-D-aliases >> $HOME/.bashrc

fi

if [[ -f $HOME/.zshrc && "$(grep R-AI-D-aliases $HOME/.zshrc | wc -l)" == "0" ]]
then
  echo "..Appending R-AI-D-aliases to $HOME/.zshrc" 1>&2
  cat R-AI-D-aliases >> $HOME/.zshrc

fi
