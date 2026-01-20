#!/bin/sh -e

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

git clone https://github.com/libuv/libuv.git
cd libuv/

sh autogen.sh
./configure --disable-shared
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp .libs/libuv.a ../../deps/lib
cd ..
