#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

echo "..Installing RustUp"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y > /dev/null 2>&1
