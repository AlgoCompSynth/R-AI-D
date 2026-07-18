FROM docker.io/jmgirard/rstudio2u:resolute
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@algocompsynth.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN userdel --remove ubuntu 2>&1 \
  && userdel --remove docker 2>&1 \
  && userdel --remove rstudio 2>&1 \
  && apt-get update -qq \
  && apt-get upgrade -qqy \
  && apt-get install -qqy \
    curl \
    firefox \
    gh \
    git-lfs \
    luajit \
    lshw \
    lynx \
    neovim \
    nvtop \
    time \
    unminimize \
    zstd \
  && echo "y" | unminimize
