#! /usr/bin/env -S bash -l

set -eu

for app in \
  /usr/share/applications/com.mitchellh.ghostty.desktop \
  /usr/share/applications/nvim.desktop \
  /usr/share/applications/nvtop.desktop \
  /usr/share/applications/rstudio.desktop

do
  echo "..Exporting $app"
  distrobox-export --app $app

done
