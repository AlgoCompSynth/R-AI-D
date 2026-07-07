#! /usr/bin/env -S bash -l

set -eu

# https://opencode.ai/
echo "..Installing OpenCode"
curl -fsSL https://opencode.ai/install | bash
echo "..OpenCode is installed."
