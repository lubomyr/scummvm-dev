#!/bin/sh

ARCH=x86

. android-$ARCH.sh

SCUMMVMDEV=$HOME/scummvm-dev
LIBPATH=$SCUMMVMDEV/3rd-android-$ARCH

if [ \! -d scummvm ]; then
  git clone https://github.com/scummvm/scummvm
fi

cd scummvm
mkdir -p $ARCH

CXXFLAGS=-isystem$LIBPATH/include
LDFLAGS=-L$LIBPATH/lib

cd $ARCH
if [ \! -f config.mk ] ; then
../configure --host=android-x86 --enable-vkeybd --enable-release
fi
make

cd ../..