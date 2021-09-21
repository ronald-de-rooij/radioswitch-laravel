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
- `git checkout -B develop`
- `git merge template/master --alow-unrelated-histories`
- Resolve the README conflict by including the template version.
- `git add README.md && git commit`

Finnaly run the install script that downloads Laravel and initializes the application
- `sh app/templates/install.sh`, follow the instruction and fill in the application details when asked

Now continue with the local setup by following the guide [local-setup](doc/local-setup.md#Configuring-the-hosts-file) from chapter 'Configuring the hosts file' 