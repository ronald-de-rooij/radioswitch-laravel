# Fresh laravel project

This repository contains the template for an example architecture around a fresh laravel project. This allows for an
easy start of a new project. The project contains the basic for a docker deployment, for both development and production
environments.

Aside from the docker architecture there is also some default documentation regarding workflows, conventions, and project
installation / setup. Feel free to edit this according to your own needs.

- [Deploying the latest version locally](docs/local-daily.md)
- [Deploying the latest version on the server](docs/server-daily.md)
- [Setting up the project on your local machine](docs/local-setup.md)
- [Setting up a server from scratch](docs/server-setup.md)
- [Rules for contributing](docs/contribution-rules.md)
- [Design decisions - why did we choose this setup?](docs/design-decisions.md)


- [Recommended packages](docs/template/recommended-packages.md), these packages are used in earlier projects and are deemed to be very useful.

## Prerequisites
Local environment has the following packages installed:
* For Windows users, WSL2 is required
* SSH agent
* Required packages installed:
  * docker
  * docker-compose
  * git

## Preparation
- Ask your PM for a clean repo (So no README either).
- Configure ssh key that has access to both your new repo and the `git@gitlab.com:wolfpackit/projects/templates/laravel.git` repo.

In this example we assume we are using the `wolfpackit/projects/mytalentslab/mtl/api-backend.git` for our new project

- `git clone wolfpackit/projects/mytalentslab/mtl/api-backend.git backend`, this clones the repo into the `backend` folder.
- `cd backend`
- `git remote add template git@gitlab.com:wolfpackit/projects/templates/laravel.git`
- `git checkout -B develop`
- `git pull template master`  
(If by any change your repo is not clean, `git pull template master --allow-unrelated-histories`)
- `sudo docker-compose -f app/docker-compose-init.yml build`
 - `git clone git@gitlab.com:wolfpackit/projects/templates/documentation-template.git docs`

Finnaly run the installation script that downloads Laravel and initializes the application. 
Follow the instruction and fill in the application details when asked.
- `sudo docker run -it --rm -v ${PWD}:/app -w /app -u $(id -u):$(id -g) app_init dos2unix app/template/*`  
- `sudo docker run -it --rm -v ${PWD}:/app -w /app -u $(id -u):$(id -g) app_init sh app/template/install.sh`
- Check if there are any code climate errors in the generated code, as described in the [Daily development routine](docs/local-daily.md#code-climate).
  If errors are found, fix them.
- `git add src && git commit -m 'Laravel template installation' && git push -u origin develop`

Now continue with the local setup by following the guide [local-setup](docs/local-setup.md#Configuring-the-hosts-file) from chapter 'Configuring the hosts file' 
