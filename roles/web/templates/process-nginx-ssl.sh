#!/usr/bin/env bash

PKI_DIR={{ nginx_pki_dir }}

jq -r '.certificate' $PKI_DIR/ssl.json > $PKI_DIR/web.crt
jq -r '.issuing_ca' $PKI_DIR/ssl.json >> $PKI_DIR/web.crt

jq -r '.private_key' $PKI_DIR/ssl.json > $PKI_DIR/private/web.key

if $(systemctl -q is-active nginx); then
  systemctl restart nginx
else
  systemctl start nginx
fi
