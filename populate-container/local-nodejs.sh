#! /usr/bin/env -S bash -l

set -eu

# https://nodejs.org/en/download
echo "..Installing Node.js"
curl -fsSL \
  https://nodejs.org/dist/v26.5.0/node-v26.5.0-linux-x64.tar.xz \
  | tar xJf - --strip-components=1 --directory=$HOME/.local \
  > /dev/null
echo "..Node.js is installed locally"
