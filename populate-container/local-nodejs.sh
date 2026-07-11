#! /usr/bin/env -S bash -l

set -eu

# https://nodejs.org/en/download
export ARCH="$(uname --machine)"
if [[ "$ARCH" == "aarch64" ]]
then
  export TARBALL="https://nodejs.org/dist/v26.5.0/node-v26.5.0-linux-arm64.tar.xz"

elif [[ "$ARCH" == "x86_64" ]]
then
  export TARBALL="https://nodejs.org/dist/v26.5.0/node-v26.5.0-linux-x64.tar.xz"

else
  echo "Unsupported hardware - exit -255!"
  exit -255

fi

echo "..Installing Node.js"
curl -fsSL \
  $TARBALL \
  | tar xJf - --strip-components=1 --directory=$HOME/.local \
  > /dev/null
echo "npm --version $(npm --version)"
echo "..Node.js is installed locally"
