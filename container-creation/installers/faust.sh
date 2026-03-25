#! /usr/bin/env bash

set -e

echo "** Faust **"

source set_container_envars

export FAUST_VERSION="2.85.5"
export FAUST_TARBALL="${FAUST_VERSION}.tar.gz"
export FAUST_URL="https://github.com/grame-cncm/faust/archive/refs/tags/$FAUST_TARBALL"
export FAUST_DIR="faust-${FAUST_VERSION}"
echo "..Installing Linux dependencies"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qqy --no-install-recommends \
  cmake \
  libmicrohttpd-dev \
  libsndfile1-dev
pushd /tmp > /dev/null
  rm --force --recursive $FAUST_TARBALL $FAUST_DIR
  echo "..Downloading $FAUST_URL"
  wget --quiet $FAUST_URL
  echo "..Unpacking $FAUST_TARBALL"
  tar xf $FAUST_TARBALL

  echo "..CMAKE_BUILD_PARALLEL_LEVEL: $CMAKE_BUILD_PARALLEL_LEVEL"
  echo "..CMAKE_INSTALL_PARALLEL_LEVEL: $CMAKE_INSTALL_PARALLEL_LEVEL"

  echo "..Building Faust compiler and libraries"
  cd $FAUST_DIR
  /usr/bin/time make libsall

  echo "..Building sound2faust"
  make sound2faust

  echo "..Installing Faust"
  sudo make install

  echo "..Cleaning up"
  cd /tmp
  rm --force --recursive $FAUST_TARBALL $FAUST_DIR

popd > /dev/null

echo "** Finished Faust **"
echo ""
