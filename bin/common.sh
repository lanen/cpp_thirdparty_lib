#!/bin/bash


function clone(){

    repo=$1
    target=$2

    if [[ -d $target ]]; then
        echo "clone $repo"
        git clone $repo $target
    fi  
}

function checkout(){
    target=$1
    branch=$2
    cd $target

    echo "checkout $branch "
    git checkout $branch
    
    cd -
}
