#! /usr/bin/env -S bash -l

set -e

toolbox rm --force fedora-toolbox
toolbox create --assumeyes \
  --image ghcr.io/ublue-os/fedora-toolbox \
  fedora-toolbox
toolbox run --container fedora-toolbox "./fedora-installs.sh"
toolbox run --container fedora-toolbox "./1_command_line_setup.sh"
