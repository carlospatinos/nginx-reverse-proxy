URL='https://reversenginx-v4-nginx8082-passthrough-reverse-proxy.mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000.mex01.containers.appdomain.cloud'

for i in {1..100}; do 
    RND=$((1 + $RANDOM % 1000))
    # $URL/get_http
    urlsArray=( $URL/get_api_demo )
    for url in "${urlsArray[@]}"
    do
    formatDate=$(date '+%Y-%m-%d.%H:%M:%S')
    echo "$i -> ${url}"
    response=$(curl -k -s -H "X-IBM-Client-Id: cf48ee8ca22bda0d29aff0bef8eb5e2e" $url)
    #echo "Response -> $response" 
    if [[ "$response" == *"$tobias.funke@reqres.in"* ]]; then
        echo "$formatDate -> valid response."
    else
        echo "$formatDate -> wrong response."
    fi
    sleep $RND
    done
done