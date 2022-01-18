curl -s -H "Host: service_b.example.com" http://localhost:8080/

#curl -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" -k https://ademo-gw-gateway-openshift-operators.cp4i-trial-cv4tz8-e8b59cf553f37698ff3156d883d193e8-0000.us-east.containers.appdomain.cloud/ddd-demo-test/sandbox/reqres/list-users\?pagina\=2

# Working 
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/search
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/demo3

# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/get_http_https
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/get_http_http
# curl -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/get_gateway
# curl -X POST -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" http://localhost:8080/post_gateway