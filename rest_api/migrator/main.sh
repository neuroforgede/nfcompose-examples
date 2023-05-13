#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

set -a

source ./prod.env
check_result "could not load ./prod.env... exiting"

exec bash migrate.sh