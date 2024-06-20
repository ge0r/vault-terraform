#! /bin/bash

# Do not convert arguments with / to paths in windows git bash
export MSYS_NO_PATHCONV=1

CERT_DIR="vault-certs"
mkdir $CERT_DIR

# Create self signed certificate and key
openssl req -newkey rsa:2048 -nodes -keyout $CERT_DIR/server.key -x509 -days 365 -out $CERT_DIR/server.crt -subj "/CN=localhost" -addext "subjectAltName = DNS:localhost"

cp $CERT_DIR/server.crt ./server.crt

docker-compose -f compose.dev.yml up --build -d
