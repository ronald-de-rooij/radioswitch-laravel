FROM nginx:alpine
COPY app/docker-configs/nginx/default.conf etc/nginx/conf.d/default.conf
