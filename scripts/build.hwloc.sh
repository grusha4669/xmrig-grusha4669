#!/bin/sh -e

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

git clone https://github.com/open-mpi/hwloc.git 
cd hwloc/

sh autogen.sh
./configure --disable-shared --enable-static --disable-io --disable-libudev --disable-libxml2
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp hwloc/.libs/libhwloc.a ../../deps/lib
cd ..
