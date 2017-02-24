#!/bin/bash

bin=`dirname $0`
base=$(cd "$bin";cd ..;pwd)

. $base/bin/common.sh

repo="https://github.com/google/googletest.git"
target=$base/build/gtest
mkdir -p $target
clone $repo $target
checkout $target "release-1.8.0" 

echo "start build gtest"

install=$base/dist/googletest

cd $target

rm -rf my_test
mkdir -p my_test
cd my_test
cmake -DCMAKE_INSTALL_PREFIX=$install ..
make && make install
