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
pip3 install -r requirements.txt