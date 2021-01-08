#!/bin/bash

cd /root/dogecoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-w64-mingw32
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-bench --enable-reduce-exports --disable-shared --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib
make -j8 install
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/dogecoind-windows-x64.zip /root/output/$HOST/bin/dogecoind.exe /root/output/$HOST/bin/dogecoin-tx.exe /root/output/$HOST/bin/dogecoin-cli.exe /root/output/$HOST/bin/test-dogecoin.exe
zip -j /root/output/dogecoinqt-windows-x64.zip /root/output/$HOST/bin/dogecoin-qt.exe
