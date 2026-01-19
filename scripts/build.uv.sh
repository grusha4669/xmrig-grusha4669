#!/bin/sh -e

UV_VERSION="$(ls -d ../lib/libuv-v* | awk -F'-v' '{print $2}')"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

cp -fr ../../lib/libuv-v${UV_VERSION}/ .

cd libuv-v${UV_VERSION}
sh autogen.sh
./configure --disable-shared
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp .libs/libuv.a ../../deps/lib
cd ..
