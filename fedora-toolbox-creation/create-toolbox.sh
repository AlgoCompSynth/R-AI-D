#! /usr/bin/env bash

set -e

toolbox create --image ghcr.io/ublue-os/fedora-toolbox r-ai-d
toolbox run r-ai-d sudo dnf upgrade
