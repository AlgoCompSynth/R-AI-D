#! /usr/bin/env -S bash -l

set -eu

for app in \
  R.desktop \
  firefox-devedition.desktop \
  nvtop.desktop \
  vim.desktop

do
  echo "..Exporting $app"
  distrobox-export --app /usr/share/applications/$app

done
