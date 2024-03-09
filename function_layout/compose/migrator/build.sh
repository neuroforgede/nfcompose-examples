#!/bin/bash

if [ "$1" == "" ]; then
    echo "no tag defined"
    exit 1
fi

cp -r ../compose .

exec docker build -f Dockerfile -t rest-api-migrator:$1 .