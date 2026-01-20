#!/bin/sh -e

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

git clone https://github.com/openssl/openssl.git
cd openssl/

./config -no-shared -no-asm -no-zlib -no-comp -no-dgram -no-filenames -no-cms
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp libcrypto.a ../../deps/lib
cp libssl.a ../../deps/lib
cd ..
