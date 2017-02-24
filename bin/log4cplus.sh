#!/bin/bash

bin=`dirname $0`
base=$(cd "$bin";cd ..;pwd)

. $base/bin/common.sh

repo="https://github.com/log4cplus/log4cplus.git"
target=$base/build/log4cplus
mkdir -p $target
clone $repo $target
checkout $target "REL_1_2_0" 

if [[ -d $target/.git ]];then 
    echo "start build log4cplus"

    install=$base/dist/log4cplus

    cd $target

    rm -rf my_test
    mkdir -p my_test
    cd my_test
    cmake -DCMAKE_INSTALL_PREFIX=$install ..
    make && make install

fi
