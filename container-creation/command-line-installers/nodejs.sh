#! /usr/bin/env bash

set -e

source set_container_envars
source $HOME/.bashrc

echo "..Installing Node.js"
curl -fsSL $NODEJS_URL \
  | tar xJf - --strip-components=1 --directory=$HOME/.local
echo "npm --version $(npm --version)"
echo "..Node.js is installed locally"
