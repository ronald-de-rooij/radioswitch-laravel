# Initial local setup

Welcome! If you're new to the team or you've received a new laptop, do the following to set up the system.

## Install the required software

* On Windows/MacOS: [install Docker Desktop](https://www.docker.com/products/docker-desktop).
* On Windows: [install Git bash](https://gitforwindows.org/)

## Clone the project

* Clone the repository in your projects folder
* Switch to the `develop` branch

## Prepare the environment files

Since environment variables are secrets, we only ship example files called `.env.example` with the code. There are two
of these; one for the application, and another for the Docker container.

Copy the files and rename them to `.env` by executing the following commands in the root of the application:

`cp src/.env.example src/.env`  
`cp mtl-app/docker.env.example mtl-app/docker.env`

### Configuring .env files

Open `src/.env` in an editor and fill in the following fields:

```dotenv
# URL for the administrator interface (e.g. admin.mtl.test)
ADMIN_HOSTNAME=
# URL for the supervisor interface (e.g. supervisor.mtl.test)
SUPERVISOR_HOSTNAME=
# URL for the API (e.g. api.mtl.test)
API_HOSTNAME=
```

### Configuring the hosts file

The URLs you've configured need to be accessible by your browser. To do this, add the following entries to your hosts
file.

On Windows, this file is located in `C:/Windows/System32/drivers/etc/hosts`. This file must be edited with administrator
privileges.

```hosts
- `127.0.0.1 admin.mtl.test`
- `127.0.0.1 api.mtl.test`
```

## Docker setup

### Create the network

Open a (bash) prompt in your projects folder and navigate to the root of this repository.

First, we need to create the Docker network and start up the reverse proxy.

Execute the following commands (Windows):

* `docker network create nginx-proxy`
* `docker-compose -f proxy/docker-compose.yml up -d`

On macOS/Linux:

* `sudo docker network create nginx-proxy`
* `sudo docker-compose -f proxy/docker-compose.yml up -d`

### Build the Docker containers

To build, execute the following commands:

* `cd mtl-app`
* `docker-compose -f docker-compose-local.yml --env-file ../src/.env up -d --build`

On macOS/Linux:

* `cd mtl-app`
* `sudo docker-compose -f docker-compose-local.yml --env-file ../src/.env up -d --build`

## Application initialization

To get everything set up and ready, execute the following commands:

* `docker exec mtl-php composer install`
* `docker exec mtl-php php artisan key:generate`
* `docker exec mtl-php php artisan passport:client --personal`

**Note:** Because `php artisan key:generate` means that the `.env` file has changed, you need
to build the Docker containers again!

## Optional

### IDE Helper
Execute the following command:

```bash
docker exec mtl-php php artisan ide-helper:models -M
```

This allows you to use constructs like 

```injectablephp
/**
 * @mixin IdeHelperUser
 */
```

### Demo data
Execute the following:

`docker exec mtl-php php artisan db:seed --class=DemoSeeder`

This creates a set of clients with fully populated organisations that can be used for testing.

### Database connection

The Postgres database is exposed to your host machine. You can connect to it using you favorite DB manager, with
host `localhost`, and the credentials that are present in the `src/.env` file.

### Mail testing

By default the local development environment uses [Mailhog](https://github.com/mailhog/MailHog) to send emails. The
mails are caught and can be viewed in your browser at http://localhost:8025 .

### PHP Debugging

Debugging your PHP code can be useful at some times. The docker configuration incorporates the ability to do that out of
the box. The only thing you need to do is to set the `XDEBUG_MODE` to `develop,debug` in `/mtl-app/docker.env`. Be sure
to restart the docker after making changes to the `/mtl-app/docker.env`.

When debugging is enabled, don't forget to configure your IDE to accept the incoming debugging connection.

Steps to take in PHPStorm:

TODO: Work out exact steps, and double check if correct and working:

- Add `PHP Remote debug` server.
- Checkmark `Filter debug connection by IDE key`
- Create Server
    * host: `localhost`
    * port: `80`
    * Check debug mapping checkbox
    * Map `/src` directory to `/var/www`
- Save

To listen to PHP Debug connections click on the small red phone in the top right corner.
![PHP Debug icon](images/php_debug_icon.png)

See [Xdebug documentation](https://xdebug.org/docs/) for detailed information.