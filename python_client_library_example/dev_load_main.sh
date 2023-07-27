#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

set -a

source ./.env
check_result "could not load ./.env... exiting"

cp -r ./compose migrator/
check_result "could not copy compose definitions to migrator directory... exiting"

cd migrator
exec bash migrate.sh