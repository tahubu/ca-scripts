#!/bin/bash

# based on https://gist.github.com/Soarez/9688998

mkdir -p newcerts
touch index.txt
if [ ! -f "./serial" ]; then
    echo '01' > serial
fi

if [ -f "./ca.crt" ] && [ -f "./ca.key" ]; then
    echo "The CA key and cert files are already generated"
    exit 1
fi

# Generate a key
openssl genrsa -out ca.key 4096

# Generate a self signed certificate for the CA
openssl req -new -x509 -key ca.key -out ca.crt

