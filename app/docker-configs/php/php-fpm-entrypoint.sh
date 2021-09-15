#!/bin/sh
env=${APP_ENV}

php artisan config:clear
php artisan route:clear
php artisan view:clear

if [ "$env" != "local" ]; then
  composer install
  php artisan migrate --force
  php artisan config:cache
  php artisan route:cache
  php artisan view:cache
fi

chown -R www-data:www-data storage bootstrap/cache

echo "starting php-fpm"
# shellcheck disable=SC2068
exec $@