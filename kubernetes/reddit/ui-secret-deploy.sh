#!/bin/bash
EXT_IP=$(kubectl get ingress -n dev 2>/dev/null | grep ui | awk '{print $4}')
CN=${EXT_IP}'.sslip.io'
echo IP addres ${EXT_IP}
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=${CN}"

tls_key=$(cat tls.key | base64 | tr -d '\n')
tls_crt=$(cat tls.crt | base64 | tr -d '\n')

envsubst < ui-secret.yml | kubectl create -f -

rm tls.key
rm tls.crt
