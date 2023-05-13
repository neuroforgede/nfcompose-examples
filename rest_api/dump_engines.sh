#!/bin/bash

source venv/bin/activate
source ./.env

compose_cli dump engines ${NF_COMPOSE_URL} --compose-user ${NF_COMPOSE_USER} --compose-password ${NF_COMPOSE_PASSWORD} --domain-aliases "${NF_COMPOSE_DOMAIN_ALIASES}" --outfile compose/engines.json