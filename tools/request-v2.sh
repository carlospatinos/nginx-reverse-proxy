#https://developers.redhat.com/blog/2017/01/24/end-to-end-encryption-with-openshift-part-1-two-way-ssl

URL='http://localhost:8080/'
curl -s -H "Host: service_b.example.com" $URL

#curl -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -k https://ademo-gw-gateway-openshift-operators.cp4i-trial-cv4tz8-e8b59cf553f37698ff3156d883d193e8-0000.us-east.containers.appdomain.cloud/ddd-demo-test/sandbox/reqres/list-users\?pagina\=2

# HTTP Working 
URL='http://localhost:8080'

# HTTPS Working 444
# URL='https://localhost:444'

# HTTPS Working 8082
URL='https://localhost:8082'

# openssl s_client -connect 127.0.0.1:8082
# logs 
# oc logs -f reversenginx-7d5c6d88dc-9cttf --tail=50

# reversenginx-v2-nginx8080 WORKING
URL='http://reversenginx-v2-nginx8080-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# Openshift 
# reversenginx-v3-nginx8082 - 404 bad request. Si se llega a nginx. The plain HTTP request was sent to HTTPS port
URL='http://reversenginx-v2-nginx8082-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# route to https port on enginx - https port Application is not available. App exists but path does not match. No se llega al nginx
URL='https://reversenginx-v2-nginx8082-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# reversenginx-v2-nginx8082-passthrough request llega a nginx WORKING?
URL='https://reversenginx-v2-nginx8082-passthrough-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# reversenginx-v2-nginx8082-edge edge 400 The plain HTTP request was sent to HTTPS port. Nginx si responde
URL='https://reversenginx-v2-nginx8082-edge-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# reversenginx-v2-nginx8082-reencrypt - Application is not available. The application is currently not serving requests at this endpoint
URL='https://reversenginx-v2-nginx8082-reencrypt-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'


# CURLs

# docker.io/carlospatinos/reversenginx:v2
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_http_https
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_http_http # not working
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_gateway
# curl -v -k -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/post_gateway # not working
curl -v -k -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -d '{"nombre": "ivan", "trabajo": "pilloni" }' $URL/ademo
