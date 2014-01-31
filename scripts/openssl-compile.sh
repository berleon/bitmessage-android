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


OPENSSL_EXCLUSION_LIST="no-krb5 no-gost no-idea no-camellia \
        no-seed no-bf no-cast no-rc2 no-rc4 no-rc5 no-md2 \
        no-md4 no-ripemd no-rsa no-sock no-ssl2 no-ssl3 \
        no-dsa no-dh no-tls1 no-x509 no-pkcs7 no-pbe no-pkcs  \
        no-tlsext no-pem no-rfc3779 no-whirlpool \
        no-ocsp no-x509v3 no-ui no-srp no-ssltrace no-tlsext \
        no-mdc2 no-engine no-tls2 no-srtp"

(cd $OPENSSL_SOURCES;
    ./Configure android

    make build_crypto

    mv libcrypto.a $LIBRARY_PATH
)
