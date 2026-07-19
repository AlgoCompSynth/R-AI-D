FROM docker.io/jmgirard/rstudio2u:resolute
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@algocompsynth.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN userdel --remove ubuntu 2>&1 \
  && userdel --remove docker 2>&1 \
  && userdel --remove rstudio 2>&1 \
  && apt-get update -qq \
  && apt-get upgrade -qqy \
  && apt-get install -qqy \
    unminimize \
  && echo "y" | unminimize
COPY image-installers/firefox-dev-edition.sh ./
RUN ./firefox-dev-edition.sh
RUN apt-get install -qqy \
  apt-file \
  curl \
  gh \
  git-lfs \
  libpam-systemd \
  lshw \
  nvtop \
  plocate \
  python3-venv \
  systemd \
  time \
  tmux \
  tree \
  vim-nox \
  zstd \
  && apt-get clean
RUN echo "options(browser = 'firefox-devedition')" \
  | tee --append /etc/R/Rprofile.site
