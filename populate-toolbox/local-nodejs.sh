#! /usr/bin/env -S bash -l

set -eu

# https://nodejs.org/en/download
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.18.0".

# Verify npm version:
npm -v # Should print "11.16.0".
