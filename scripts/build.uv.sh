#!/bin/sh -e

UV_VERSION="1.51.0"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

cp -fr ../../lib/libuv-${UV_VERSION} .

cd libuv-${UV_VERSION}
./configure --disable-shared
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp .libs/libuv.a ../../deps/lib
cd ..
