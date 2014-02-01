#! /usr/bin/env bash

set -e

if [ ! ${1} ]; then
    echo "$@"
    echo "usage is $0 ./script.sh"
    echo "Try '$0 --help' for more information"
    exit 1
fi

if [ "$1" == "--help" ]; then
    echo "the '$0' script helps to cross compile libraries for android"
    echo "make sure \$ANDROID_NDK points to your local Android NDK"
    exit 0
fi

COMPILE_SCRIPT="$1"

if [ ! ${ANDROID_NDK} ]; then
    echo "export \`ANDROID_NDK\' to the directory of your local ndk"
    echo "Try '$0 --help' for more information"
    exit 1
fi

if [ ! ${ANDROID_PLATFORM_VERSION} ]; then
    ANDROID_PLATFORM_VERSION=$(./scripts/project-target.sh)
fi

PROJECT_ROOT=$(pwd)


HOST_INFO=`uname -a`
case ${HOST_INFO} in
    Darwin*)
        TOOLCHAIN_SYSTEM=darwin-x86
        ;;
    Linux*)
        if [[ "${HOST_INFO}" == *i686* ]]
        then
            TOOLCHAIN_SYSTEM=linux-x86
        else
            TOOLCHAIN_SYSTEM=linux-x86_64
        fi
        ;;
    *)
        echo "Toolchain unknown for host system"
        exit 1
        ;;
esac

export GCC_VERSION="4.8"

# ------- ARM ----------------------

export ARCH="arm"
export MARCH="armv7-a"
export TOOLCHAIN="arm-linux-androideabi-$GCC_VERSION"
export ANDROID_TOOLCHAIN_DIR="/tmp/cross-compile-$ANDROID_PLATFORM_VERSION-$ARCH/"
# if [ ! -d "$ANDROID_TOOLCHAIN_DIR" ]; then
    ${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh \
        --platform=${ANDROID_PLATFORM_VERSION} \
        --install-dir=${ANDROID_TOOLCHAIN_DIR} \
        --system=${TOOLCHAIN_SYSTEM} \
        --toolchain=${TOOLCHAIN} \
        --arch=${ARCH}

# fi

export PATH=${ANDROID_TOOLCHAIN_DIR}/bin:$PATH

export RANLIB="arm-linux-androideabi-ranlib"
export AR="arm-linux-androideabi-ar"
export CC="arm-linux-androideabi-gcc"
export SYSROOT="$ANDROID_TOOLCHAIN_DIR/sysroot"
export TARGET="arm-linux-androideabi"
export HOST="arm-linux-androideabi"

export LIBRARY_PATH="$PROJECT_ROOT/jni/prebuild/armeabi/"
mkdir -pv $LIBRARY_PATH

$COMPILE_SCRIPT

# ------- X86 --------------------------
exit 0

export ARCH="x86"
export ANDROID_TOOLCHAIN_DIR="/tmp/cross-compile-$ANDROID_PLATFORM_VERSION-x86/"
${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh \
    --platform=${ANDROID_PLATFORM_VERSION} \
    --install-dir=${ANDROID_TOOLCHAIN_DIR} \
    --system=${TOOLCHAIN_SYSTEM} \
    --arch=$ARCH

export PATH=${ANDROID_TOOLCHAIN_DIR}/bin:$PATH

export RANLIB="i686-linux-android-ranlib"
export AR="i686-linux-android-ar"
export CC="i686-linux-android-gcc"
export SYSROOT="$ANDROID_TOOLCHAIN_DIR/sysroot"

export TARGET="i686-linux-androideabi"
export HOST="i686-linux-androideabi"


export LIBRARY_PATH="$PROJECT_ROOT/jni/prebuild/x86/"
mkdir -pv $LIBRARY_PATH

$COMPILE_SCRIPT
