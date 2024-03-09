#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

echo "Comparing local changes with server..."
OPERATIONS=`cat ./compose/dataseries-create-view.json`
check_result 'failed to get OPERATIONS! Exiting...'

if [ "$OPERATIONS" != "[]" ]; then
    echo "found operations: $OPERATIONS"

    echo "Applying operations now..."

    echo "$OPERATIONS" | compose_cli apply dataseries-create-view ${NF_COMPOSE_URL} --compose-user ${NF_COMPOSE_USER} --compose-password ${NF_COMPOSE_PASSWORD}
    check_result 'failed to apply operations! Exiting...'

    echo "success."

else
    echo "found no operations"
fi