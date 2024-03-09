#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

echo "Comparing local changes with server..."
DIFF=`compose_cli diff engines ${NF_COMPOSE_URL} ./compose/engines.json  --base-type compose --base-compose-user ${NF_COMPOSE_USER} --base-compose-password ${NF_COMPOSE_PASSWORD} --domain-aliases "${NF_COMPOSE_DOMAIN_ALIASES}"`
check_result 'failed to get diff! Exiting...'

if [ "$DIFF" != "[]" ]; then
    echo "found diff: $DIFF"

    echo "Applying diffs now..."

    echo "$DIFF" | compose_cli apply engines-diff ${NF_COMPOSE_URL} --compose-user ${NF_COMPOSE_USER} --compose-password ${NF_COMPOSE_PASSWORD}
    check_result 'failed to apply diff! Exiting...'

    echo "success."

else
    echo "found no diff"
fi