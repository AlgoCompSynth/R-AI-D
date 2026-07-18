FROM docker.io/jmgirard/rstudio2u:resolute
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@algocompsynth.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN userdel --remove ubuntu 2>&1 \
  && userdel --remove docker 2>&1 \
  && userdel --remove rstudio 2>&1 \
  && apt-get update -qq \
  && apt-get upgrade -qqy \
  && apt-get install -qqy \
    software-properties-common \
    unminimize \
  && echo "y" | unminimize \
  && add-apt-repository -y ppa:mozillateam/ppa
RUN apt-get install -qqy \
  apt-file \
  curl \
  firefox-esr \
  gh \
  git-lfs \
  libpam-systemd \
  lshw \
  luajit \
  neovim \
  nvtop \
  plocate \
  python3-venv \
  systemd \
  time \
  tmux \
  tree \
  zstd \
  && apt-get clean
