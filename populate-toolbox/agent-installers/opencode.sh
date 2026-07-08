#! /usr/bin/env -S bash -l

set -eu

# https://opencode.ai/
echo "..Activating nvm"
source $HOME/.nvm/nvm.sh
echo "..Installing OpenCode"
npm i -g opencode-ai
echo "..OpenCode is installed."
