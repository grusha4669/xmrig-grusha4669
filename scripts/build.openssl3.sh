#!/bin/sh -e

OPENSSL_VERSION="$(ls -d ../lib/openssl-* | awk -F'-' '{print $2}')"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

cp -fr ../../lib/openssl-${OPENSSL_VERSION}/ .

cd openssl-${OPENSSL_VERSION}
./config -no-shared -no-asm -no-zlib -no-comp -no-dgram -no-filenames -no-cms
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp libcrypto.a ../../deps/lib
cp libssl.a ../../deps/lib
cd ..
