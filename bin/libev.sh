#!/bin/bash

bin=`dirname $0`
base=$(cd "$bin";cd ..;pwd)

. $base/bin/common.sh

repo="https://github.com/enki/libev.git"
target=$base/build/libev

mkdir -p $target
clone $repo $target

echo "start build libev"

install=$base/dist/libev

cd $target

./configure --prefix=$install
make && make install
