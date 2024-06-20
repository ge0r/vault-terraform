#!/bin/bash

# Make sure to source this file in order to export the vault server specific information for terraform
export VAULT_ADDR="https://localhost:8201/"
export VAULT_TOKEN="00000000-0000-0000-0000-000000000000"
export VAULT_CACERT="../vault-dev-deploy/server.crt"
