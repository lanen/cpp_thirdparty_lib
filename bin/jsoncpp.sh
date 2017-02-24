#!/bin/bash

bin=`dirname $0`
base=$(cd "$bin";cd ..;pwd)

. $base/bin/common.sh

repo="https://github.com/open-source-parsers/jsoncpp.git"
f="jsoncpp"
tag="1.8.0"
target=$base/build/$f
mkdir -p $target

clone $repo $target

if [[ -d $target/.git ]];then 
    echo "start build $f"
    checkout $target "$tag" 

    install=$base/dist/$f

    cd $target

    rm -rf my_test
    mkdir -p my_test
    cd my_test
    cmake -DCMAKE_INSTALL_PREFIX=$install ..
    make && make install

fi
