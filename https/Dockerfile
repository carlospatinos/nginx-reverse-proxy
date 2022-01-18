FROM nginxinc/nginx-unprivileged
# COPY nginx-os4.conf /etc/nginx/nginx.conf
COPY ./nginx_configs/ /etc/nginx/conf.d/
COPY ./proxy/ /usr/share/nginx/html/
COPY ./ssl/ /usr/share/ssl

WORKDIR /app
EXPOSE 8080 8082
CMD ["nginx", "-g", "daemon off;"]