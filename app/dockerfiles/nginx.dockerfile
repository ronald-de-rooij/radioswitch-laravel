FROM nginx:alpine
COPY src/docker-configs/nginx/default.conf /etc/nginx/conf.d/default.conf
