#!/bin/bash

bin=`dirname $0`
base=$(cd "$bin";cd ..;pwd)

. $base/bin/common.sh

repo="https://github.com/google/protobuf.git"
f=protobuf
target=$base/build/$f

mkdir -p $target
clone $repo $target

if [[ -d $target/.git ]]; then
    
    cd $target
    checkout $target "3.2.0"

    echo "start build protobuf"
    
    chmod +x ./autogen.sh
    ./autogen.sh

    install=$base/dist/$f
    ./configure --prefix=$install
    make && make install


fi

 
