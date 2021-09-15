# Recommended packages

In this file recommendations are made on packages to use. Those packages are already used in different projects and are
deemed to be useful. A small introduction is given for the package, for details always check the repository.

## L5-swagger / API Documentation

**Repo:** https://github.com/DarkaOnLine/L5-Swagger

#### Installation

* composer require "darkaonline/l5-swagger

#### Description/usage

The package allows you to write swagger annotations for each API call in your controller

After updating the annotations in the controllers, you need to update to generate the swagger documentation to see the
changes. This can be done with the command: `docker exec app-php php artisan l5-swagger:generate`

This procedure can be automized by setting `L5_SWAGGER_GENERATE_ALWAYS` in the `.env` file from
`false` to `true` and rebuild the containers.

Some more extensive guide on this package including some example controllers can be
found [here](https://ivankolodiy.medium.com/how-to-write-swagger-documentation-for-laravel-api-tips-examples-5510fb392a94)
.

## Laravel-permission

**Repo:** https://github.com/spatie/laravel-permission/tree/main

#### Installation

See https://spatie.be/docs/laravel-permission/v5/installation-laravel

#### Description/usage

The package allows for easy permission management. It allows for both direct permissions as wel as a full RBAC solution.
It is really versatile and can be incorporated in every project.


## IDE Helper

**Repo:** https://github.com/barryvdh/laravel-ide-helper

#### Installation

* `composer require --dev barryvdh/laravel-ide-helper`

#### Description/usage

This package creates helper files for IDEs to aid the developer with autocompletes. It does this on an

`php artisan ide-helper:generate` used for facades autocomplete. The code is written to `_ide_helper.php`.

`php artisan ide:model -M` is the second call. This one is used to help autocomplete for Eloquent models. The `-M`
parameter avoids the package from adding to annotations to the models itself, and rather write it
to `_ide_helper_models.php`. This avoids cluttered models and should always be used. Calling this command should be done
after editing attributes, or relations of any eloquent model.

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