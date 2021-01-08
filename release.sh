#!/bin/bash
sudo rm -rf output
mkdir output

docker rm dogecoin-build

echo Starting build
docker run --detach --name dogecoin-build -v $PWD/../dogecoin-release:/root/dogecoin -v $PWD/output:/root/output dogecoinbuild ./build-all.sh
