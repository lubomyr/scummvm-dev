#!/bin/sh

export ANDROID_SDK=~/android/android-sdk-linux
export ANDROID_NDK=~/android/android-ndk-r11c
export PATH=~/android/android-ndk-r11c/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH
export PATH=~/scummvm-dev/3rd-android-armeabi-v7a/bin:$PATH
PREFIX=${ANDROID_NDK}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
export CC=${PREFIX}gcc
export CXX=${PREFIX}g++
export AS=${PREFIX}gcc
export LD=${PREFIX}gcc
export AR=${PREFIX}ar cru
export RANLIB=${PREFIX}ranlib
export STRIP=${PREFIX}strip
export OBJCOPY=${PREFIX}objcopy
export CPP=${PREFIX}cpp

export MACHDEP="--sysroot=$ANDROID_NDK/platforms/android-4/arch-arm -g -mandroid -mthumb-interwork"

export CFLAGS="${MACHDEP} -Os -Wall -mandroid -msoft-float -march=armv7-a -mfpu=vfpv3-d16"

export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="${CFLAGS}"

export LDFLAGS="${MACHDEP}"

echo "./configure --host=arm --prefix=~/scummvm-dev/3rd-android-armeabi-v7a"