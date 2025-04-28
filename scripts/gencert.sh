#!/bin/sh

export CUR_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
export CUR_PATH="$(cd -- "$CUR_PATH" && pwd)"
export CERT_PATH=${CUR_PATH}/nginx/certs

# create self-signed server certificate:

# read -p "Enter your domain [www.example.com]: " DOMAIN
export DOMAIN=vscode

echo "Create server key..."

openssl genrsa -out $CERT_PATH/$DOMAIN.key 2048

echo "Create server certificate signing request..."

SUBJECT="/C=US/ST=Mars/L=iTranswarp/O=iTranswarp/OU=iTranswarp/CN=$DOMAIN"

openssl req -new -subj $SUBJECT -key $CERT_PATH/$DOMAIN.key -out $CERT_PATH/$DOMAIN.csr

echo "Remove password..."

mv $CERT_PATH/$DOMAIN.key $CERT_PATH/$DOMAIN.origin.key
openssl rsa -in $CERT_PATH/$DOMAIN.origin.key -out $CERT_PATH/$DOMAIN.key

echo "Sign SSL certificate..."

openssl x509 -req -days 3650 -in $CERT_PATH/$DOMAIN.csr -signkey $CERT_PATH/$DOMAIN.key -out $CERT_PATH/$DOMAIN.crt

echo "TODO:"
echo "Copy $DOMAIN.crt to /etc/nginx/ssl/$DOMAIN.crt"
echo "Copy $DOMAIN.key to /etc/nginx/ssl/$DOMAIN.key"
echo "Add configuration in nginx:"
echo "server {"
echo "    ..."
echo "    listen 443 ssl;"
echo "    ssl_certificate     /etc/nginx/ssl/$DOMAIN.crt;"
echo "    ssl_certificate_key /etc/nginx/ssl/$DOMAIN.key;"
echo "}"