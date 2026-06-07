#! /usr/bin/env -S bash -l

set -e

toolbox rm --force fedora-toolbox
toolbox create --assumeyes --image ghcr.io/ublue-os/fedora-toolbox
export HERE=$PWD
toolbox run --container fedora-toolbox "$HERE/fedora-installs.sh"
toolbox run --container fedora-toolbox "$HERE/1_command_line_setup.sh"
