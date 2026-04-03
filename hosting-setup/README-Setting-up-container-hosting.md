# Setting up Container Hosting

This directory contains scripts for setting up container hosting. I currently
test only on Raspberry Pi OS, which is based on Debian 13, and on Bluefix DX,
which has container hosting built in. The `1_apt_packages.sh` script should
work on any 64-bit Debian 13 or Ubuntu 24.04 LTS system. The other scripts
should work on any 64-bit Linux system that Homebrew supports.

To set up container hosting, run the three scripts

- `./1_apt_packages.sh`
- `./2_command_line_setup.sh`
- `./3_container_hosting.sh`

in that order.
