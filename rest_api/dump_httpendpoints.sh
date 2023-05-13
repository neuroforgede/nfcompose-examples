#!/bin/bash

source venv/bin/activate
source ./.env

compose_cli dump httpendpoints ${NF_COMPOSE_URL} --compose-user ${NF_COMPOSE_USER} --compose-password ${NF_COMPOSE_PASSWORD} --outfile compose/httpendpoints.json