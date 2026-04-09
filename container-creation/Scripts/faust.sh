#! /usr/bin/env bash

set -e

echo "** Faust **"

source set_script_envars
export LOGFILE=$LOGFILES/faust.log
rm --force $LOGFILE

export CMAKE_BUILD_PARALLEL_LEVEL="$(nproc)"
export CMAKE_INSTALL_PARALLEL_LEVEL="$(nproc)"
export FAUST_VERSION="2.85.5"
export FAUST_TARBALL="${FAUST_VERSION}.tar.gz"
export FAUST_URL="https://github.com/grame-cncm/faust/archive/refs/tags/$FAUST_TARBALL"
export FAUST_DIR="faust-${FAUST_VERSION}"
export LLVM_VERSION=20

echo "..Installing Linux dependencies"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qqy --no-install-recommends \
  cmake \
  doxygen \
  doxygen-latex \
  doxygen-doc \
  graphviz \
  libmicrohttpd-dev \
  libpolly-$LLVM_VERSION-dev \
  libsndfile1-dev \
  llvm-$LLVM_VERSION \
  llvm-$LLVM_VERSION-dev \
    >> $LOGFILE 2>&1

export PATH=/usr/lib/llvm-$LLVM_VERSION/bin:$PATH
pushd $PROJECTS > /dev/null
  rm --force --recursive $FAUST_TARBALL $FAUST_DIR
  echo "..Downloading $FAUST_URL"
  wget --quiet $FAUST_URL
  echo "..Unpacking $FAUST_TARBALL"
  tar xf $FAUST_TARBALL

  echo "..CMAKE_BUILD_PARALLEL_LEVEL: $CMAKE_BUILD_PARALLEL_LEVEL"
  echo "..CMAKE_INSTALL_PARALLEL_LEVEL: $CMAKE_INSTALL_PARALLEL_LEVEL"

  echo "..Building Faust compiler and libraries"
  cd $FAUST_DIR
  /usr/bin/time make libsall \
    >> $LOGFILE 2>&1

  echo "..Building sound2faust"
  /usr/bin/time make sound2faust \
    >> $LOGFILE 2>&1

  echo "..Building documentation"
  /usr/bin/time make doc \
    >> $LOGFILE 2>&1

  echo "..Installing Faust"
  sudo make install \
    >> $LOGFILE 2>&1

popd > /dev/null

echo "** Finished Faust **"
echo ""
