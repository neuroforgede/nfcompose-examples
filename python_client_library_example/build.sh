#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

CUR_DIR=$(pwd)

cd $CUR_DIR
cd migrator && bash build.sh $1
check_result "failed to build migrator"
