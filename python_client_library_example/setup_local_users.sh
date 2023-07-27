#!/bin/bash

check_result () {
    ___RESULT=$?
    if [ $___RESULT -ne 0 ]; then
        echo $1
        exit 1
    fi
}

source venv/bin/activate
source ./.env

docker exec -it ${NF_COMPOSE_CONTAINER_NAME} bash -c "cd /neuroforge/skipper && python manage.py create_tenant --name ${NF_COMPOSE_TENANT_NAME} --upsert"
check_result "failed to create tenant"
docker exec -it ${NF_COMPOSE_CONTAINER_NAME} bash -c "cd /neuroforge/skipper && python manage.py create_user --tenant ${NF_COMPOSE_TENANT_NAME} --username ${NF_COMPOSE_USER} --password ${NF_COMPOSE_PASSWORD} --staff --superuser --upsert"
check_result "failed to setup user"