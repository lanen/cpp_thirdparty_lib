#!/bin/bash
#https://dev.mysql.com/doc/connector-cpp/en/connector-cpp-source-configuration-options.html
bin=`dirname $0`
base=$(cd "$bin";cd ..;pwd)

. $base/bin/common.sh

f="mysql-connector-c++-1.1.8-macos10.12-x86-64bit"
repo="https://dev.mysql.com/get/Downloads/Connector-C++/$f.tar.gz"

target=$base/build/mysql
mkdir -p $target
cd $target
if [[ ! -f $f.tar.gz ]];then
    wget $repo
fi
tar -zxvf $f.tar.gz

cp -R $target/$f $base/dist/mysql
   # install=$base/dist/mysql
   # mkdir -p t
   # cd t 
   # cmake -DBOOST_ROOT=/usr/local/opt/boost -DCMAKE_INSTALL_PREFIX=$install ..
   # make && make install 


