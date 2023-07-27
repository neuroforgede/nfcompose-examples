#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

bash prod_load_groups.sh
check_result "failed to load groups..."

bash prod_load_dataseries.sh
check_result "failed to load dataseries..."

bash prod_load_engines.sh
check_result "failed to load engines..."

bash prod_load_httpendpoints.sh
check_result "failed to load httpendpoints..."

bash prod_load_views.sh
check_result "failed to load views..."

bash extra.sh
check_result "failed to load extra tasks..."

echo "success..."
exit 0