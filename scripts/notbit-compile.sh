#! /usr/bin/env bash

set -e

if [ "$1" == "--help" ]; then
    echo "compiles notbit for android"
    exit 0
fi

SOURCE_DIR="./extern/notbit"
cp -vR /usr/include/openssl $SYSROOT/usr/include
(cd $SOURCE_DIR;
    ./configure \
        --build=$TOOLCHAIN_SYSTEM \
        --host=$HOST \
        --target=$TARGET \
        --disable-shared \
        CFLAGS="-march=$MARCH --sysroot=$SYSROOT" LDFLAGS="-L/$LIBRARY_PATH"

    make
    cp -v ./src/.libs/libnotbit.a $LIBRARY_PATH
)

