#! /usr/bin/env bash

set -e

if [[ "$(grep R-AI-D_aliases $HOME/.bashrc | wc -l)" == "0" ]]
then
  echo "..Appending R-AI-D_aliases to $HOME/.bashrc" 1>&2
  cat R-AI-D_aliases >> $HOME/.bashrc
fi

if [[ -f $HOME/.zshrc && "$(grep R-AI-D_aliases $HOME/.zshrc | wc -l)" == "0" ]]
then
  echo "..Appending R-AI-D_aliases to $HOME/.zshrc" 1>&2
  cat R-AI-D_aliases >> $HOME/.zshrc
fi
