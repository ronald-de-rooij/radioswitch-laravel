# Architecture

The backend is effectively a monolith with a single point of entry - the API. It is supported by various services.

#### Cron service

The cron service is build on a simple php:alpine image. This service copies a file called `crontab` to the container
that calls the laravel scheduler each minute. It enables the use of scheduled commands in Laravel.

#### Queue service

The queue service is build on a simple php:alpine image. The service calls the artisan command `queue:work`, which
executes all commands that are put on the queue. For more information on Queues and dispatching jobs
see [here](https://laravel.com/docs/9.x/queues)

## Application

The application Docker is a bit more complex. It requires building steps to ensure the application is run smoothly.
Configuration files can be found in the `/app` folder. It consists of the following folders/files:

* `docker-configs/nginx/default.conf`, nginx configuration that handles incoming traffic and passes along to php-fpm.
* `docker-configs/php/php-fpm-entrypoint.sh`, script that is executed when the docker image is started. It handles
  deployment steps like composer install and migrations. Except for all necessary steps it also optimizes performance in
  case it is a production environment.
* `docker-configs/php/xdebug-local.ini`, configuration file that maps XDebug variables from the environment docker
  environment file to the XDebug configuration.
* `docker-compose.yml`, this file combines the different docker images into one container. It also configures how the
  images link to the host machine, using volumes, environment variables and exposed ports. The Docker-compose file
  consists of three different images.:
    * Nginx, handles traffic from the reverse proxy and passes it along to php-fpm according to the `nginx/default.conf`
      file.
    * Postgres, the DB that is used. The DB requires username, password and DB name. It stores its data using volumes.
      So the data is persisted on the host machine in folder `/db-data/`
    * PHP, the PHP-FPM that handles the incoming request and returns the views/data. This image is the most elaborate.
      Building this docker is done by following the `Dockerfile`. This file decides which PHP version is used, and which
      PHP extensions will be installed/enabled. Furthermore, it installs composer into the docker image, such that
      composer packages can be installed. The last step is to call the entry script `php/php-fpm-entrypoint.sh`. This
      script ensures that all migrations are executed, all composer package are installed and permissions of the laravel
      cache/storage is configured correctly. Finally it optimizes Laravels performance in case of a production build.
    * Node, the node docker is responsible for installing and compiling all npm dependencies. For local development, it
      keeps running and keeps watching for file changes. After changes are made, resources are automatically
      compiled/published. The production variant only compiles once.
    * [DEV ONLY] Mailhog catches all outbound emails and is displays them in a local UI on port 8025
