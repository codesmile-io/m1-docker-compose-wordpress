#!/bin/sh
# Generate a self-signed certificate with subjectAltName (SAN).
openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
  -keyout domain.key \
  -out signed.crt \
  -subj "/CN=${DOMAIN}" \
  -addext "subjectAltName=DNS:${DOMAIN}" \
  -addext "extendedKeyUsage=serverAuth"
