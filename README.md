# Laravel Starter Project

This repository contains the template for an example architecture around a fresh Laravel project. This allows for an
easy start of a new project. The project contains the basic for a Docker deployment, for both development and production
environments.

Aside from the Docker architecture there is also some default documentation regarding workflows, conventions, and
project installation / setup. Feel free to edit this according to your own needs.

## Prerequisites

Local environment has the following packages installed:

* For Windows users, WSL2 is required
* SSH agent
* Required packages installed:
    * `docker`
    * `docker-compose`
    * `git`

## Preparation

- Ask your PM for a clean repository. It must be empty - that also means no auto-generated README!
- Configure ssh key that has access to both your new repo and
  the `git@gitlab.com:wolfpackit/projects/templates/laravel.git` repo.

In this example we assume we are using the `wolfpackit/projects/mytalentslab/mtl/api-backend.git` for our new project

- `git clone wolfpackit/projects/mytalentslab/mtl/api-backend.git backend`, this clones the repo into the `backend`
  folder.
- `cd backend`
- `git remote add template git@gitlab.com:wolfpackit/projects/templates/laravel.git`
- `git checkout -B develop`
- `git pull template master`  
  (If by any change your repo is not clean, `git pull template master --allow-unrelated-histories`)
- `sudo docker-compose -f app/docker-compose-init.yml build`
- `git clone git@gitlab.com:wolfpackit/projects/templates/documentation-template.git docs && rm docs/.git -Rf`

Finally, run the installation script that downloads Laravel and initializes the application. Follow the instruction and
fill in the application details when asked.

- `sudo docker run -it --rm -v ${PWD}:/app -w /app -u $(id -u):$(id -g) app_init dos2unix app/template/*`
- `sudo docker run -it --rm -v ${PWD}:/app -w /app -u $(id -u):$(id -g) app_init sh app/template/install.sh`
- Check if there are any code climate errors in the generated code, as described in
  the [Daily development routine](laravel-docs/dailyTasks/localTasks.md#code-climate). If errors are found, fix them.
- `git add -A && git commit -m 'Laravel template installation' && git push -u origin develop`
- Update documentation replace {PROJECT_ABBR} with the project abbreviation just filled in.

Now continue with the local setup by following the
guide [local-setup](laravel-docs/initialSetup/localSetup.md#configuring-the-hosts-file)
from the chapter 'Configuring the hosts file'.

# Recommended packages

In this file recommendations are made on packages to use. Those packages are already used in different projects and are
deemed to be useful. A small introduction is given for the package, for details always check the repository.

## l5-swagger / API Documentation

**Repo:** https://github.com/DarkaOnLine/L5-Swagger

### Installation

```shell
sudo docker exec {PROJECT_ABBR}-php composer require darkaonline/l5-swagger
```

Also, make sure to publish the files:

```
sudo docker exec {PROJECT_ABBR}-php php artisan vendor:publish --provider "L5Swagger\L5SwaggerServiceProvider"
```

Check the `src/config` folder - there should be a `l5-swagger.php` file in there.

### Description/usage

The package allows you to write Swagger annotations for each API call in your controller.

After updating the annotations in the controllers, you need to update to generate the Swagger documentation to see the
changes. This can be done with the command: `sudo docker exec {PROJECT_ABBR}-php php artisan l5-swagger:generate`

This procedure can be automated by setting `L5_SWAGGER_GENERATE_ALWAYS` in the `.env` file from
`false` to `true` and rebuild the containers.

Some more extensive guide on this package including some example controllers can be
found [here](https://ivankolodiy.medium.com/how-to-write-swagger-documentation-for-laravel-api-tips-examples-5510fb392a94)
.

### Caveats

Debugging errors is not entirely trivial, but a good starting point is to add the following to `Controller.php`.

```php
/**
 * @OA\Info(
 *      version="1.0.0",
 *      title="My API",
 *      description="The coolest API ever!"
 * )
 *
 * @OA\Schema(
 *      schema="response-success",
 *      type="object",
 *      description="Success response",
 *      @OA\Property(
 *          property="message",
 *          description="Response message",
 *          type="string",
 *      ),
 *  ),
 */
```

## Laravel-permission

**Repo:** https://github.com/spatie/laravel-permission/tree/main

### Installation

See https://spatie.be/docs/laravel-permission/v5/installation-laravel

### Description/usage

The package allows for easy permission management. It allows for both direct permissions as wel as a full RBAC solution.
It is really versatile and can be incorporated in every project.

## IDE Helper

**Repo:** https://github.com/barryvdh/laravel-ide-helper

### Installation

* `composer require --dev barryvdh/laravel-ide-helper`

### Description/usage

This package creates helper files for IDEs to aid the developer with autocompletion. It writes a set of aliases
to `_ide_helper.php`.

Execute the following command to rescan and regenerate everything:

```shell
sudo docker exec {PROJECT_ABBR}-php php artisan ide-helper:generate
```

Also, execute:

```shell
sudo docker exec {PROJECT_ABBR}-php php artisan ide:model -M
```

This call is used to help autocomplete for Eloquent models. The `-M` parameter avoids the package from adding to
annotations to the models itself, and rather write it to `_ide_helper_models.php`. This avoids cluttered models and
should always be used. Calling this command should be done after editing attributes, or relations of any eloquent model.

It is advised to add the following line to the `composer.json`. This generates the required files automatically after
each `composer update` command

```
  "post-update-cmd": [
            "Illuminate\\Foundation\\ComposerScripts::postUpdate",
            "@php artisan ide-helper:generate",
            "@php artisan ide-helper:meta",
            "@php artisan ide:model -M"
        ],
```

## Sentry integration

**Repo:** https://gitlab.com/wolfpackit/internal/infrastructure/sentry

This repository is merely added for information purposes; it is not necessary to install this yourself, since that's
already done. A Sentry installation is already running on https://sentry.wolfpackit.nl/.

### Installation

Create a new project in https://sentry.wolfpackit.nl/organizations/wolfpack/projects/ (if you don't have the permission
to do this, request your PM for more information.)

Sentry will generate a set of instructions for the project. An example can be found
here: https://sentry.wolfpackit.nl/wolfpack/vakmedianet/getting-started/php-laravel/ .

If everything went correctly, two variables have been added to your `.env` file.

```dotenv
SENTRY_LARAVEL_DSN=
SENTRY_TRACES_SAMPLE_RATE=
```

### Usage

Execute the following in the console:

```shell
sudo docker exec {PROJECT_ABBR}-php php artisan sentry:generate-message
```

A message should now show up in Sentry.