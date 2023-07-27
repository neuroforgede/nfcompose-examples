#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

echo "Comparing local changes with server..."
DIFF=`compose_cli diff httpendpoints ${NF_COMPOSE_URL} ./compose/httpendpoints.json  --base-type compose --base-compose-user ${NF_COMPOSE_USER} --base-compose-password ${NF_COMPOSE_PASSWORD}`
check_result 'failed to get diff! Exiting...'

if [ "$DIFF" != "[]" ]; then
    echo "found diff: $DIFF"

    echo "Applying diffs now..."

    echo "$DIFF" | compose_cli apply httpendpoints-diff ${NF_COMPOSE_URL} --compose-user ${NF_COMPOSE_USER} --compose-password ${NF_COMPOSE_PASSWORD}
    check_result 'failed to apply diff! Exiting...'

    echo "success."

else
    echo "found no diff"
fi