#! /usr/bin/env -S bash -l

set -eu

# https://pi.dev/
echo "..Installing Pi coding agent"
curl -fsSL https://pi.dev/install.sh | sh
echo "..Pi coding agent is installed."
