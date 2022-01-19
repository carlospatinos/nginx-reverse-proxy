curl -s -H "Host: service_b.example.com" http://localhost:8080/

#curl -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -k https://ademo-gw-gateway-openshift-operators.cp4i-trial-cv4tz8-e8b59cf553f37698ff3156d883d193e8-0000.us-east.containers.appdomain.cloud/ddd-demo-test/sandbox/reqres/list-users\?pagina\=2

# HTTP Working 
# NO curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/demo3
# NO curl -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/post_gateway
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/get_http_https
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/get_http_http
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/get_gateway
# curl -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -d '{"nombre": "ivan", "trabajo": "pilloni" }' http://localhost:8080/ademo

# HTTPS Working
# NO curl -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" https://localhost:444/demo3
# NO curl -v -k -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" https://localhost:444/post_gateway
# curl -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" https://localhost:444/get_http_https
# curl -v -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" https://localhost:444/get_http_http
# curl -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" https://localhost:444/get_gateway
# curl -v -k -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -d '{"nombre": "ivan", "trabajo": "pilloni" }' https://localhost:444/ademo

# Openshift http port
URL='http://reversenginx-root-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'


# CURLs
curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_http_https
curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_http_http
curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $URL/get_gateway
curl -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -d '{"nombre": "ivan", "trabajo": "pilloni" }' $URL/ademo

# Openshift http port
URL='https://reversenginx-https-root-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'
