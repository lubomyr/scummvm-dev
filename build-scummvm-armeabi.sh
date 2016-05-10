#!/bin/sh

ARCH=armeabi

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
../configure --host=android --enable-vkeybd --disable-all-engines --enable-engine=scumm
fi
make

cd ../..