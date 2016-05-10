Scripts for build Android port of ScummVM

You must have linux console to use it.

Install Android sdk&ndk (i unpacked it into ~/android directory)
http://developer.android.com/ndk/downloads/index.html
https://developer.android.com/sdk/index.html

Run Android SDK Manager and download:
Android SDK Tools
Android SDK Platform-tools
Android SDL Build tools
+SDK Platform (API 14)

// ARCH support: armeabi, armeabi-v7a, x86, mips
// 3rd libs: png,jpeg,ogg,mad,tremor,vorbis,theora,faad2,freetype2

cd ~
git clone https://github.com/lubomyr/scummvm-dev
cd scummvm-dev

// armeabi
. build_3rdlib-armeabi.sh
. build-scummvm-armeabi.sh

// armeabi-v7a
. build_3rdlib-armeabi-v7a.sh
. build-scummvm-armeabi-v7a.sh

// x86
. build_3rdlib-x86.sh
. build-scummvm-x86.sh

// x86
. build_3rdlib-mips.sh
. build-scummvm-mips.sh
