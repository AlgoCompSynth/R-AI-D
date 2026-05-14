#! /usr/bin/env bash

set -e

echo "** Restore man pages **"

echo "..Installing unminimize"
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get upgrade -qqy
apt-get install -qqy --no-install-recommends \
  unminimize

echo "..Running unminimize"
echo "y" | unminimize

echo "** Finished Restore man pages **"
echo ""
