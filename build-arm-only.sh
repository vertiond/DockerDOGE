#!/bin/bash

cd /root/dogecoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=arm-linux-gnueabihf NO_QT=1
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure LDFLAGS=-static-libstdc++ --disable-bench -enable-glibc-back-compat --enable-reduce-exports --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib
make -j8 install
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/dogecoind-arm-linux-gnueabihf.zip /root/output/$HOST/bin/dogecoind /root/output/$HOST/bin/dogecoin-tx /root/output/$HOST/bin/dogecoin-cli /root/output/$HOST/bin/test_dogecoin
