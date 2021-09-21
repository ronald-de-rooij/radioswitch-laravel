FROM php:8.0.3-alpine

RUN apk add postgresql-dev
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install  pdo pdo_pgsql pgsql

COPY docker-configs/cron/crontab /etc/crontabs/root

CMD ["crond", "-f"]