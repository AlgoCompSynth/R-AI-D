#! /usr/bin/env -S bash -l

set -eu

for app in \
  /usr/share/applications/nvtop.desktop

do
  echo "..Exporting $app"
  distrobox-export --app $app

done
