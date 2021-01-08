#!/bin/bash

cd /root/dogecoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=aarch64-linux-gnu
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-bench --enable-glibc-back-compat --enable-reduce-exports --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib
make -j8 install
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/dogecoind-aarch64-linux-gnu.zip /root/output/$HOST/bin/dogecoind /root/output/$HOST/bin/dogecoin-tx /root/output/$HOST/bin/dogecoin-cli /root/output/$HOST/bin/test-dogecoin
zip -j /root/output/dogecoinqt-aarch64-linux-gnu.zip /root/output/$HOST/bin/dogecoin-qt
