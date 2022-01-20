
reversenginx-v3-nginx8080
reversenginx-v3-https-root
reversenginx-v3-https-passthrough
reversenginx-v3-https-edge
reversenginx-v3-https-rencrypt

SERVICE=reversenginx-v3
oc expose service $SERVICE --target-port=8080
oc create route edge --service=$SERVICE --cert=${MASTER_CONFIG_DIR}/ca.crt --key=${MASTER_CONFIG_DIR}/ca.key --ca-cert=${MASTER_CONFIG_DIR}/ca.crt --hostname=www.example.com
oc create route edge --service=$SERVICE --cert=${MASTER_CONFIG_DIR}/ca.crt --key=${MASTER_CONFIG_DIR}/ca.key --ca-cert=${MASTER_CONFIG_DIR}/ca.crt --hostname=www.example.com