# Fresh laravel project

This repository contains the template for an example architecture around a fresh laravel project. This allows for an
easy start of a new project. The project contains the basic for a docker deployment, for both development and production
environments.

Aside from the docker architecture there is also some default documentation regarding workflows, conventions, and project
installation / setup. Feel free to edit this according to your own needs.

- [Deploying the latest version locally](doc/local-daily.md)
- [Deploying the latest version on the server](doc/server-daily.md)
- [Setting up the project on your local machine](doc/local-setup.md)
- [Setting up a server from scratch](doc/server-setup.md)
- [Rules for contributing](doc/contribution-rules.md)
- [Design decisions - why did we choose this setup?](doc/design-decisions.md)


- [Recommended packages](doc/template/recommended-packages.md), these packages are used in earlier projects and are deemed to be very useful.

## Preparation
- Ask your PM for a clean repo.
- Configure ssh key that has access to both your new repo and the `git@gitlab.com:wolfpackit/projects/templates/laravel.git` repo.

In this example we assume we are using the `wolfpackit/projects/mytalentslab/mtl/api-backend.git` for our new project

- `git clone wolfpackit/projects/mytalentslab/mtl/api-backend.git backend`, this clones the repo into the `backend` folder.
- `cd backend`
- `git remote add template git@gitlab.com:wolfpackit/projects/templates/laravel.git`


## URLs

The following URLs are used for each of the deployments.

### Subdomains / prefixes

- `app` is for the Vue-based front-end that is used by the clients of MyTalentsLab
- `api` is for the RESTful API that is used by the Vue-based front-end
- `admin` is for the PHP-based back-end that is used by MyTalentsLab administrators
- `supervisor` is for the PHP-based back-end that is used by the client's supervisors

### Production

- https://app.mytalentslab.nl
- https://api.mytalentslab.nl
- https://admin.mytalentslab.nl
- https://supervisor.mytalentslab.nl

https://www.mytalentslab.nl is not managed by Wolfpack.

Alternatively, the production server can be reached as follows:

- https://app.prd.mtl.wolfpackit.nl
- https://api.prd.mtl.wolfpackit.nl
- https://admin.prd.mtl.wolfpackit.nl
- https://supervisor.prd.mtl.wolfpackit.nl

For the API documentation, see https://api.prd.mtl.wolfpackit.nl/docs/

### Acceptance

- https://app.acc.mtl.wolfpackit.nl
- https://api.acc.mtl.wolfpackit.nl
- https://admin.acc.mtl.wolfpackit.nl
- https://supervisor.acc.mtl.wolfpackit.nl

For the API documentation, see https://api.acc.mtl.wolfpackit.nl/docs/

### Develop server

- https://app.dev.mtl.wolfpackit.nl
- https://api.dev.mtl.wolfpackit.nl
- https://admin.dev.mtl.wolfpackit.nl
- https://supervisor.dev.mtl.wolfpackit.nl

For the API documentation, see https://api.dev.mtl.wolfpackit.nl/docs/
