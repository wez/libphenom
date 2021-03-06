#!/bin/sh
set -x
case `uname` in
  Linux)
    sudo apt-get update -y -q
    sudo apt-get install -y valgrind -q
    sudo apt-get install -y libc-ares-dev -q
    ;;
esac

HERE=$PWD

# There is no CK package available for ubuntu yet
CK_VER=0.3.2
CK_RELEASE=https://github.com/sbahra/ck/archive/$CK_VER.tar.gz
if test ! -f $CK_VER.tar.gz ; then
  wget $CK_RELEASE
  tar xzf $CK_VER.tar.gz
fi
cd ck-$CK_VER
./configure --prefix=$HERE/thirdparty/ck || exit 1
make install || exit 1
cd ..

