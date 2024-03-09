#!/bin/bash

if [ "$1" == "" ]; then
    echo "no tag defined"
    exit 1
fi

exec docker push rest-api-migrator:$1