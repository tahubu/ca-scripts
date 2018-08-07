#!/bin/bash

echo "Please give the domain name: "

read domain

dir=${domain}

mkdir ${dir}

# Generate an RSA key
openssl genrsa -out "${dir}/${domain}.key" 4096

# Generate Certificate Signing Request
openssl req -new -key "${dir}/${domain}.key" -out "${dir}/${domain}.csr"

echo "Please give the domain names, separated by space: "
echo "(example: *.test.net test.net)"

read domains

cat > "${dir}/${domain}.extensions.cnf" <<EOL
basicConstraints=CA:FALSE
subjectAltName=@my_subject_alt_names
subjectKeyIdentifier = hash

[ my_subject_alt_names ]
EOL

counter=1
for d in $domains; do
    echo "DNS.${counter} = ${d}" >> "${dir}/${domain}.extensions.cnf"
    counter=$((counter+1))
done

echo "Sign the key..."

# Sign the key
openssl ca -config ca.conf -out "${dir}/${domain}.crt" -extfile "${dir}/${domain}.extensions.cnf" -in "${dir}/${domain}.csr"

# Delete config files
rm -f "${dir}/${domain}.extensions.cnf"
rm -f "${dir}/${domain}.csr"

