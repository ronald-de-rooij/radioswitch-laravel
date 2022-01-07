# Daily development routine

**Note:** if this is your first time working on this project, please check out [the local setup](local-setup.md) first.

## Before you start on a new feature

- Ensure Docker Desktop is started (see also **Rebuilding containers**)
- `git pull --ff-only` to update your repository
- `docker exec app-php composer install` in case new packages were installed
- `docker exec app-php php artisan migrate` in case database changes were made

## Updating Composer

To let Composer update all packages, run:

- `docker exec app-php composer update`

Please keep your updates separate from regular commits that only change code. Installing new packages as part of a
feature is fine, but to reduce potential merge conflicts, execute updates separately.

All the commands that you would normally use in the CLI directly should now be propagated through the php-fpm docker.
Code changes made in the repository are immediately visible in your local application.

## Rebuilding containers

If changes are made to either Docker files or network related environment variables, you need to rerun the starting
command, assuming you are in the project's root directory:

Windows:

* `cd app`
* `docker-compose -f docker-compose-local.yml --env-file ../src/.env up -d --build`

macOS/Linux:

* `cd app`
* `sudo docker-compose -f docker-compose-local.yml --env-file ../src/.env up -d --build`

## Code climate

You can locally run the code climate checks by executing the following command in the `src` directory:
  ```
  docker run -it --rm \
  -v ${PWD}:/app \
  -w /app \
  -u $(id -u):$(id -g) \
  app_init sh -c 'cd src && vendor/bin/phpcs --basepath=.. --report=full --standard=PSR12 --extensions=php --ignore=app/Support/helpers.php app'
  ```

## Laravel Telescope
By default the project comes with some developer support in the form of [Laravel Telescope](https://laravel.com/docs/8.x/telescope).
This tool keeps track of everything you need to debug problems.
Including queries, gates, rquest, exceptions etc. 
This information can be found at the `/telescope` endpoint. E.G http://admin.mtl.test/telescope.
Note that this is only available when Laravel is running with environment `local`.

## Jobs, queues and Mailhog

Mailhog can be reached at `http://localhost:8025/`. It is a fake SMTP system where you can send test e-mails to.

