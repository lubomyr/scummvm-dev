#!/bin/sh

export ANDROID_SDK=~/android/android-sdk-linux
export ANDROID_NDK=~/android/android-ndk-r11c
export PATH=~/android/android-ndk-r11c/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64/bin:$PATH
export PATH=~/scummvm-dev/3rd-android-mips/bin:$PATH
PREFIX=${ANDROID_NDK}/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64/bin/mipsel-linux-android-
export CC=${PREFIX}gcc
export CXX=${PREFIX}g++
export AS=${PREFIX}gcc
export LD=${PREFIX}gcc
export AR=${PREFIX}ar cru
export RANLIB=${PREFIX}ranlib
export STRIP=${PREFIX}strip
export OBJCOPY=${PREFIX}objcopy
export CPP=${PREFIX}cpp

export MACHDEP="--sysroot=$ANDROID_NDK/platforms/android-9/arch-mips -g -mandroid"

export CFLAGS="${MACHDEP} -Os -Wall -mandroid"

export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="${CFLAGS}"

export LDFLAGS="${MACHDEP}"

echo "./configure --host=mips --prefix=~/scummvm-dev/3rd-android-mips"