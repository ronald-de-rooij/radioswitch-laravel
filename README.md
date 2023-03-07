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

- Ask your PM for a clean repository. It must be _completely_ empty - that also means no auto-generated README!
- Configure an SSH key that has access to both your newly created repo and
  the `git@gitlab.com:wolfpackit/projects/templates/laravel.git` repo.

In this example we assume we are using the `wolfpackit/projects/homelab/backend-api.git` as our new project.

First, clone the repository so that it's available locally.

- Navigate to your `projects` folder.
- `git clone wolfpackit/projects/homelab/backend-api.git backend`, this clones the repo into the `backend`
  folder.
- `cd backend`

Note: the use of the `backend` folder in this case is entirely optional. Omitting `backend` means that the created
folder uses the name of the repo itself (in this case `backend-api`).

Now, add the starter project.

```shell
git remote add template git@gitlab.com:wolfpackit/projects/templates/laravel.git
git checkout -B main
git pull template master
```

If by any change your repo was not clean, execute `git pull template master --allow-unrelated-histories`

Then:

```shell
sudo docker compose --file ./app/docker-compose-init.yml build
```

If this doesn't work, try `sudo docker system prune`

Finally:

```shell
git clone git@gitlab.com:wolfpackit/projects/templates/documentation-template.git docs && rm docs/.git -Rf
```

## Installation

To make setup easier, this template provides an automated installation script. This will ask a series of questions. To prepare for these questions, make sure to note down the following first.

Often, projects have multiple names.

For instance, the full project name with capital letters (`Learning By Testing`) is shown to the user. However, in code,
it's more practical to use either:

* The `PROJECT_SLUG` - a lowercase kebab-variant (`learning-by-testing`)
* The `PROJECT_ABBR` - an abbreviated lowercase variant (`lbt`).

Abbreviations are only necessary for long names. If the `PROJECT_SLUG` is short enough to use as a hostname, use that
instead of an abbreviation.

With this information available, installation can be started!

Execute the following:

```shell
sudo docker run -it --rm -v ${PWD}:/app -w /app -u $(id -u):$(id -g) app-init dos2unix app/template/*
```

> ⚠ **Warning:** ⚠
>
> Before you run the next script, ensure you have all your necessary data ready! The script does not work well if it
> is interrupted!
>
> Also, unless you need to run two databases side-by-side, just keep the default names for all the database questions.

Execute the following:

```shell
sudo docker run -it --rm -v ${PWD}:/app -w /app -u $(id -u):$(id -g) app-init sh app/template/install.sh
```

The hostname for local development is either `PROJECT_ABBR.test` or `PROJECT_SLUG.test`.

- Check if there are any code climate errors in the generated code, as described in
  the [Daily development routine](laravel-docs/dailyTasks/localTasks.md#code-climate). If errors are found, fix them.
- `git add -A && git commit -m 'Laravel template installation' && git push -u origin main`
- Update the documentation and replace all instances of `{PROJECT_ABBR}` with the abbreviation you chose.
- Update the documentation and replace all instances of `{PROJECT_SLUG}` with the slug you chose.

Now continue with the local setup by following the
guide [local-setup](laravel-docs/initialSetup/localSetup.md#configuring-the-hosts-file)
from the chapter 'Configuring the hosts file'.

# Recommended packages

In this file recommendations are made on packages to use. Those packages are already used in different projects and are
deemed to be useful. A small introduction is given for the package, for details always check the repository.

## l5-swagger / API Documentation

**Repo:** https://github.com/DarkaOnLine/L5-Swagger

### Alternative option

Use https://gitlab.com/wolfpackit/projects/templates/laravel-api . This lets you skip several steps.

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

## PHPStorm settings

### Auto line length refactor
> Preferences > Editor > Code Style > PHP > Wrapping & Braces > Chained Method Calls > Select: Chop down if long

### Reformat on Save
> Preferences > Tools > Action on Save > Enable: Reformat code

### Auto Pint on Save
> Preferences > Tools > File Watchers > Add

Then add a watcher named `Pint` and apply the following settings:

```
File Type: PHP
Scope: Project Files
Program: $ProjectFileDir$/src/vendor/bin/pint
Arguments: $FileRelativePath$ --config src/pint.json
Output paths to refresh: $FileRelativePath$
Working directory: $ProjectFileDir$
Advanced options: Enabled only: Trigger the watcher on external changes
```

Click OK to save and then set the watcher on save:
> Preferences > Tools > Action on Save > Enable: File Watcher: Pint
