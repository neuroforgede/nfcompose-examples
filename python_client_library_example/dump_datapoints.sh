#!/bin/bash

ALL_DATASERIES=(
)

source venv/bin/activate
source ./.env

for DATASERIES in ${ALL_DATASERIES[@]}
do
    compose_cli dump datapoints ${NF_COMPOSE_URL} ${DATASERIES} --compose-user ${NF_COMPOSE_USER} --compose-password ${NF_COMPOSE_PASSWORD} --outfile compose/datapoints/${DATASERIES}.json
done
