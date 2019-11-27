#!/usr/bin/env bash

openssl genrsa \
  -des3 \
  -passout pass:my-amazing-password \
  -out /usr/local/apache2/conf/protected-key.pem \
  2048
openssl rsa \
  -passin pass:my-amazing-password \
  -in /usr/local/apache2/conf/protected-key.pem \
  -out /usr/local/apache2/conf/server.key
openssl req \
  -new \
  -key /usr/local/apache2/conf/server.key \
  -out /usr/local/apache2/conf/cert.csr \
  -subj "/C=US/ST=IA/L=Des\ Moines/O=PlanetHolt/OU=bpholt/CN=localhost"
openssl x509 \
  -req \
  -days 3650 \
  -in /usr/local/apache2/conf/cert.csr \
  -signkey /usr/local/apache2/conf/server.key \
  -out /usr/local/apache2/conf/server.crt

exec /usr/local/bin/httpd-foreground
