#!/bin/bash

source .env

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip3 install --force-reinstall https://github.com/neuroforgede/nfcompose/releases/download/release%2F2.0.0/compose_client-2.0.0.tar.gz