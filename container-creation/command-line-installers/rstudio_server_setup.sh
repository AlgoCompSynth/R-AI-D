#! /usr/bin/env bash

set -e

echo "..Copying nerd fonts to /etc/rstudio/fonts/"
sudo cp $HOME/.fonts/*.ttf /etc/rstudio/fonts/

echo "..Enabling and starting RStudio Server"
sudo systemctl enable rstudio-server.service
