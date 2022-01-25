version='5'
docker build -t carlospatinos/reversenginx:v$version . 
# docker run -it  carlospatinos/reversenginx:v$version # ssh
# docker run -p 8080:80 -p 444:443 carlospatinos/reversenginx:v$version
docker run -p 8080:8080 -p 8082:8082 carlospatinos/reversenginx:v$version
# push 
docker push carlospatinos/reversenginx:v$version
# URL for openshift 
echo docker.io/carlospatinos/reversenginx:v$version

# docker.io/mendhak/http-https-echo



# History
# v2 different endpoints and all working locally, http working on openshift and also passthrough
# v3 SAME AS ABOVE BUT "/usr/share/nginx/html/nginx_status/index.html" is not found


# docker build -t carlospatinos/reversenginxecho:v$version . 
# docker run -p 8080:8080 -p 8443:8443 carlospatinos/reversenginxecho:v$version