docker build -t carlospatinos/reversenginx:v2 . 
# docker run -it  carlospatinos/reversenginx:v1
docker run -p 8080:80 -p 444:443 carlospatinos/reversenginx:v2

docker push carlospatinos/reversenginx:v2

# docker.io/carlospatinos/reversenginx:v2