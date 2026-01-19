#!/bin/sh -e

HWLOC_VERSION="$(ls -d ../lib/hwloc-* | awk -F'-' '{print $2}')"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

cp -fr ../../lib/hwloc-${HWLOC_VERSION} .

cd hwloc-${HWLOC_VERSION}
./configure --disable-shared --enable-static --disable-io --disable-libudev --disable-libxml2
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp hwloc/.libs/libhwloc.a ../../deps/lib
cd ..
