FROM php:8.0.3-fpm

WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libjpeg62-turbo-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    zip \
    unzip \
    dos2unix \

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install zip exif pcntl mbstring exif bcmath gd pdo pdo_pgsql pgsql

# Update php config variables
RUN echo "upload_max_filesize = 25M" > /usr/local/etc/php/php.ini && \
    echo "post_max_size = 25M" >> /usr/local/etc/php/php.ini

COPY app/docker-configs/cron/crontab /etc/crontabs/root

#Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY src/composer.json src/composer.lock ./
RUN composer install --no-scripts --optimize-autoloader --no-dev

#Copy source code
COPY --chown=www-data:www-data src ./

#Optimize performance
RUN composer dump-autoload
RUN php artisan config:cache && php artisan route:cache && php artisan view:cache
