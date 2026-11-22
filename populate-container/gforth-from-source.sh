#! /bin/bash

set -eu

# https://gforth.org/
export GFORTH_VERSION="1.0.1"
export GFORTH_TARBALL="gforth-${GFORTH_VERSION}.tar.xz"
export GFORTH_URL="https://www.complang.tuwien.ac.at/forth/gforth/Snapshots/${GFORTH_VERSION}/${GFORTH_TARBALL}"
export GFORTH_DIR="gforth-${GFORTH_VERSION}"

export LOGFILE=$HOME/Logfiles/gforth-from-source.log
echo "" > $LOGFILE

pushd $HOME/Projects > /dev/null

    echo "....Downloading $GFORTH_URL"
    rm -fr $GFORTH_TARBALL $GFORTH_DIR
    wget --quiet $GFORTH_URL

    echo "....Unpacking $GFORTH_TARBALL"
    tar xfJ $GFORTH_TARBALL

    echo "....Installing dependencies"
    cd $GFORTH_DIR
    ./install-deps.sh \
        >> $LOGFILE 2>&1

    echo "....Configuring"
    ./configure \
        >> $LOGFILE 2>&1

    echo "....Compiling"
    make \
        >> $LOGFILE 2>&1

    echo "....Making documentation"
    make \
        >> $LOGFILE 2>&1

    echo "....Installing"
    sudo make install \
        >> $LOGFILE 2>&1

    popd > /dev/null

echo "....Finished"
echo ""
