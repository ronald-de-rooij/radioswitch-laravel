FROM php:8.0.3-fpm-alpine
WORKDIR /var/www/html

# Install system dependencies
RUN apk add --update git \
    bash \
    curl \
    libjpeg-turbo-dev \
    libpng-dev \
    oniguruma-dev \
    libxml2-dev \
    libzip-dev \
    postgresql-dev	\
    zip \
    unzip


################
# DEV SPECIFIC #
################
#Install xdebug
RUN apk add --no-cache \
    $PHPIZE_DEPS
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

#RUN chown www-data:www-data /var/www/html/storage -Rf
################


# Clear cache
RUN rm /var/cache/apk/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install zip exif pcntl mbstring exif bcmath gd pdo pdo_pgsql pgsql

# Update php config variables
RUN echo "upload_max_filesize = 25M" > /usr/local/etc/php/php.ini && \
    echo "post_max_size = 25M" >> /usr/local/etc/php/php.ini

#Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY docker-configs/cron/crontab /etc/crontabs/crontab
RUN cat /etc/crontabs/crontab >> /etc/crontabs/root
