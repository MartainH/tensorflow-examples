#!/bin/bash

BLIS_VERSION=blis
INSTALL_DIR=`pwd`

export PATH=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin:$PATH
export C_INCLUDE_PATH=$NDK_ROOT/platforms/android-19/arch-arm/usr/include
export CC="arm-linux-androideabi-gcc --sysroot=$NDK_ROOT/platforms/android-19/arch-arm -march=armv7-a -mfloat-abi=softfp"
export LD="arm-linux-androideabi-ld"
export AR="arm-linux-androideabi-ar"
export RANLIB="arm-linux-androideabi-ranlib"
export STRIP="arm-linux-androideabi-strip"
#export CFLAGS="-mfpu=neon -mfloat-abi=softfp"
export BLIS_ENABLE_VERBOSE_MAKE_OUTPUT=yes

cd $BLIS_VERSION
./configure -p $INSTALL_DIR armv7a

make -j4
make install

