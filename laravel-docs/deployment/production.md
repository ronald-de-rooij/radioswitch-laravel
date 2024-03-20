# Deploying on Production

Deployment on production is a partially automated process. This means that there is no automated deploy after updating
the `main` branch. Instead, **tags** are used as a mechanism to label a version as ready for production use.

At the moment, there are two steps involved in the deploy procedure:

- creating a new tag
- updating the infrastructure configuration

## Create a new tag

For this, Developer-level permissions in Gitlab are required.

In Gitlab, navigate to Repository > Tags.

Create a new tag. Ensure this tag follows the rules of [semantic versioning](https://semver.org/), and make sure that it
starts with a lowercase letter `v` - for example, `v0.1.4` would be a correct tag.

> ⚠ **Warning:** ⚠
>
> Wait until the tag has been created and all the pipelines have finished work before updating
> the infrastructure configuration!

## Update the infrastructure configuration

For this, access to https://github.com/wolfpack-it/ is required. Ask your project manager for access.

- open the [infrastructure Github repository]() #TODO update repo url
- locate the `values.yaml` file for the production environment (see `environments/prod/apps/values.yaml`)
- find the following fragment in the code:

```yaml
tags:
  frontend: v0.0.14
  api: v0.1.4
```

Changing the `api` tag from `v0.1.3` to `v0.1.4` will trigger ArgoCD to start a deploy. This can take several minutes.