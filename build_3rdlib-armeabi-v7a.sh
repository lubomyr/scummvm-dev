#!/bin/sh

ARCH=armeabi-v7a

. android-$ARCH.sh

SCUMMVMDEV=$HOME/scummvm-dev
LIBPATH=$SCUMMVMDEV/3rd-android-$ARCH

mkdir -p 3rd-android-$ARCH
mkdir -p 3rdlib_src
cd 3rdlib_src

if [ \! -d libpng-1.6.21 ]; then
  wget "http://downloads.sourceforge.net/project/libpng/libpng16/1.6.21/libpng-1.6.21.tar.xz"
  tar xvf libpng-1.6.21.tar.xz
  rm libpng-1.6.21.tar.xz
fi
cd libpng-1.6.21
make distclean
./configure --host=$ARCH --prefix=$LIBPATH
make
make install
cd ..

if [ \! -d jpeg-6b ]; then
  wget "http://downloads.sourceforge.net/project/libjpeg/libjpeg/6b/jpegsr6.zip"
  unzip jpegsr6.zip
  rm jpegsr6.zip
  dos2unix jpeg-6b/configure
fi
cd jpeg-6b
make distclean
./configure --host=$ARCH --prefix=$LIBPATH
make
cp libjpeg.a $LIBPATH/lib
cp $SCUMMVMDEV/patches/jconfig.h $LIBPATH/include
cp jerror.h $LIBPATH/include
cp jmorecfg.h $LIBPATH/include
cp jpegint.h $LIBPATH/include
cp jpeglib.h $LIBPATH/include
cd ..

if [ \! -d libogg-1.3.2 ]; then
  wget "http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz"
  tar xvf libogg-1.3.2.tar.gz
  rm libogg-1.3.2.tar.gz
fi
cd libogg-1.3.2
make distclean
./configure --host=$ARCH --prefix=$LIBPATH
make
make install
cd ..

if [ \! -d libmad-0.15.1b ]; then
  wget "https://sourceforge.net/projects/mad/files/libmad/0.15.1b/libmad-0.15.1b.tar.gz"
  tar xvf libmad-0.15.1b.tar.gz
  rm libmad-0.15.1b.tar.gz
fi
cd libmad-0.15.1b
make distclean
./configure --host=$ARCH --prefix=$LIBPATH --enable-speed --enable-fpm=arm --disable-aso
make
make install
cd ..

if [ \! -d Tremor ]; then
  svn co http://svn.xiph.org/branches/lowmem-branch/Tremor
fi
cd Tremor
make distclean
./autogen.sh --host=$ARCH --prefix=$LIBPATH --enable-low-accuracy --enable-64kHz-limit
make
make install
cd ..

if [ \! -d libvorbis-1.3.5 ]; then
  wget "http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.xz"
  tar xvf libvorbis-1.3.5.tar.xz
  rm libvorbis-1.3.5.tar.xz
fi
cd libvorbis-1.3.5
make distclean
./configure --host=$ARCH --prefix=$LIBPATH
make
make install
cd ..

if [ \! -d flac-1.2.1 ]; then
  wget "http://downloads.xiph.org/releases/flac/flac-1.2.1.tar.gz"
  tar xvf flac-1.2.1.tar.gz
  rm flac-1.2.1.tar.gz
fi
cd flac-1.2.1
make distclean
./configure --host=$ARCH --prefix=$LIBPATH --disable-largefile --disable-thorough-tests --disable-doxygen-docs --disable-xmms-plugin --disable-cpplibs --disable-ogg --disable-oggtest --disable-rpath
make
make install
cd ..

if [ \! -d libtheora-1.1.1 ]; then
  wget "http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2"
  tar xvf libtheora-1.1.1.tar.bz2
  rm libtheora-1.1.1.tar.bz2
fi
cd libtheora-1.1.1
make distclean
./configure --host=$ARCH --prefix=$LIBPATH --with-ogg=$LIBPATH --disable-examples
make
make install
cd ..

if [ \! -d faad2-2.7 ]; then
  wget "http://downloads.sourceforge.net/faac/faad2-2.7.tar.gz"
  tar xvf faad2-2.7.tar.gz
  rm faad2-2.7.tar.gz
fi
cd faad2-2.7
make distclean
./configure --host=$ARCH --prefix=$LIBPATH
make
make install
cd ..

if [ \! -d freetype-2.6.2 ]; then
  wget "http://download.savannah.gnu.org/releases/freetype/freetype-2.6.2.tar.gz"
  tar xvf freetype-2.6.2.tar.gz
  rm freetype-2.6.2.tar.gz
fi
cd freetype-2.6.2
make distclean
./configure --host=$ARCH --prefix=$LIBPATH
make
make install
cd ..

cd ..