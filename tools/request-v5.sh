#https://developers.redhat.com/blog/2017/01/24/end-to-end-encryption-with-openshift-part-1-two-way-ssl

# HTTP Working 
URL='http://localhost:8080'

# HTTPS Working 8082
URL='https://localhost:8082'

# openssl s_client -connect 127.0.0.1:8082
# DOMAIN='https://reversenginx-v3-nginx8082-passthrough-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# echo | openssl s_client -showcerts -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null | openssl x509 -inform pem -noout -text
# logs 
oc logs -f reversenginx-v5-5f5779c4c5-x7vcr --tail=50

# 2022/01/20 11:59:08 [error] 24#24: *1128 "/usr/share/nginx/html/nginx_status/index.html" is not found (2: No such file or directory), client: 127.0.0.1, server: localhost, request: "GET /nginx_status/ HTTP/1.1", host: "localhost:8080"
# reversenginx-v5-nginx8080
URL='http://reversenginx-v5-nginx8080-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'

# Openshift 
# reversenginx-v4-nginx8082
# 404 bad request. Si se llega a nginx. The plain HTTP request was sent to HTTPS port

# route to https port on enginx - https port Application is not available. App exists but path does not match. No se llega al nginx

# reversenginx-v5-nginx8082-passthrough request llega a nginx WORKING
URL='https://reversenginx-v5-nginx8082-passthrough-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
# reversenginx-v5-nginx8082-edge
URL='https://reversenginx-v5-nginx8082-edge-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'

# CURLs
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/nginx_status
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_http
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_https
curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_api_demo
curl -v -k -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -d '{"nombre": "ivan", "trabajo": "pilloni" }' $URL/post_api_demo
curl --insecure -vvI $URL 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'



OS_DOMAIN=$(oc get ingresses.config/cluster -o jsonpath={.spec.domain})
oc create route edge reversenginx-v4-8082-route \
                       --service reversenginx-v4 \
                       --key ./ssl-cluster/tls.key \
                       --cert ./ssl-cluster/tls.crt \
                       --hostname=$OS_HOSTNAME \
                       --port=8082

URL='https://reversenginx-v4-8082-route-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
