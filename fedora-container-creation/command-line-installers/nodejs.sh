#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

echo "..Installing Node.js"
curl -fsSL $NODEJS_URL \
  | tar xJf - --strip-components=1 --directory=$HOME/.local \
  > /dev/null
echo "npm --version $(npm --version)"
echo "..Node.js is installed locally"
