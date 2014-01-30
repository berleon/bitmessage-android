#! /usr/bin/env bash

set -e

OPENSSL_SHA1_FILE=`ls extern/openssl-*.sha1`
OPENSSL_SHA1_BASENAME=$(basename "$OPENSSL_SHA1_FILE")

# strip of .sha1
OPENSSL_TAR_NAME="${OPENSSL_SHA1_BASENAME%.*}"
OPENSSL_TAR="/tmp/$OPENSSL_TAR_NAME"

# strip of tar.gz from openssl-1.0.1f.tar.gz
OPENSSL_SOURCES="./extern/${OPENSSL_TAR_NAME%.*.*}"

if ( [ ! -e $OPENSSL_TAR ] && [ ! -d $OPENSSL_SOURCES ] ); then
    echo "> Downloading $OPENSSL_TAR_NAME\" from \"http://www.openssl.org/source/$OPENSSL_TAR_NAME\""
    curl -o "/tmp/$OPENSSL_TAR_NAME" "http://www.openssl.org/source/$OPENSSL_TAR_NAME"
fi
if [ ! -d $OPENSSL_SOURCES ]; then
    mkdir -pv extern/
    tar -C extern/ -xvf "$OPENSSL_TAR"
fi

./scripts/build-openssl-libraries.sh "$OPENSSL_SOURCES"


