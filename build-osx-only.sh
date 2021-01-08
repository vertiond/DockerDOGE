#!/bin/bash

cd /root/dogecoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-apple-darwin11
mkdir -p depends/SDKs depends/sdk-sources
curl https://bitcoincore.org/depends-sources/sdks/MacOSX10.11.sdk.tar.gz --output depends/sdk-sources/MacOSX10.11.sdk.tar.gz
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-bench --disable-shared --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib
make -j8 install
make deploy
cp Dogecoin-Core.dmg $WORKSPACE/out/$HOST
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/dogecoind-osx-x64.zip /root/output/$HOST/bin/dogecoind /root/output/$HOST/bin/dogecoin-tx /root/output/$HOST/bin/dogecoin-cli /root/output/$HOST/bin/test-dogecoin
cp /root/output/$HOST/Dogecoin-Core.dmg /root/output/dogecoin-qt.dmg
