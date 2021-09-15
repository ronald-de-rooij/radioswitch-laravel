# Server installation/configuration

This document details how to set up a server from scratch.

## Order a VPS

* Order a VPS at TransIP (BladeVPS menu). If you don't have
  access, [ask the responsible person](https://wolfpackit.atlassian.net/wiki/spaces/WOL/pages/1087143937/Wolfpack+admins)
* Choose performance plan (production requires at least an X4)
* (Optional) configure specific resources
* Choose operating system (default: Ubuntu 20.04LTS)
* Set the username to `wolfpack`
* Add
  the [SSH key of the developers](https://wolfpackit.atlassian.net/wiki/spaces/WOL/pages/1566474255/Public+SSH+keys+of+wolves)
  If any of the developers are not present in this list, ask them to create a pair and request a project manager to add
  this to the Wiki. If the developers have already submitted their keys, just check the checkbox. SSH keys can be added
  to the server on a different moment as well. The guideline is to use non-password protected for development/acceptance
  server, and use password-protected keys for production environments.
* Click "Order VPS".
* Wait a few seconds and refresh the menu.
* Rename the VPS, format:  `Client-environment`. e.g `MyTalentsLab-acceptance`
* Write down the IP address of the server, you will need this in the next step.

## Configure DNS

* Go to 'domain and hosting'
* Go to the `wolfpackit.nl` domain name
* Scroll down until you see an empty field
* Enter DNS name in the first field in the `deployment-stage-abbreviation.project-abbreviation` format (e.g `acc.mtl`).
  Choose "A record" and fill out the IP address that you wrote down
* Save

This ensures the domain name `acc.mtl` with the suffix `wolfpackit.nl` is linked to the given IP address.

## Connecting to the server

* Open your SSH client
* Connect to host: `acc.mtl.wolfpackit.nl` with username `wolfpack`. Be sure to provide your SSH key with the
  authentication request, since only access is provided if your SSH key is registered for the user.

Providing your SSH key is depending on the SSH client you use. Read the manual on the procedure to do this.

If you are using [PuTTY (Windows)](https://www.putty.org/), you can provide the key by following the next steps:

* Open PuTTY.
* Under "Connection" -> "SSH" -> "Auth".
* At the option 'Private key file for authentication', press browse and select your private key that corresponds to the
  public key that is configured on the server.
* (Optional) Check the "Allow agent forwarding".  (This is useful for repo access
  see [configure repos](#configure-repositories))

## Allow SSH connection for other developers.

* Edit file `/home/wolfpack/.ssh/authorized_keys`, e.g `nano home/wolfpack/.ssh/authorized_keys`
* Insert the public key from the given developers.
* save file.

## Installing software

### Install generic packages

* `sudo apt install zip git`

### Install Docker

See https://docs.docker.com/engine/install/ubuntu/ for a detailed explanation on steps taken.

At the time of writing the following commands will do:

* `sudo apt-get update`
* ` sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release`
* ` curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`
* `echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
* `sudo apt-get update`
* `sudo apt-get install docker-ce docker-ce-cli containerd.io`

### Install Docker-compose

* `sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
* `sudo chmod +x /usr/local/bin/docker-compose`

## Configure repositories

For this steps it is important to have read-access to the Gitlab repository with the SSH key you used to login into the
server. This can be checked by going to https://gitlab.com/-/profile/keys , make sure the SSH key used for login is
listed here. Next to these required permissions it is important that agent forwarding is enabled for your SSH
connection. Read the details regarding agent
forwarding [here](https://docs.github.com/en/developers/overview/using-ssh-agent-forwarding)

If you are using putty, you can follow the next steps:

* Open PuTTY.
* Under "Connection" -> "SSH" -> "Auth".
* (Optional) Check the "Allow agent forwarding".

Now we will clone the repositories into their own folders

* `mkdir sites`
* `cd sites`
* `git clone git@gitlab.com:wolfpackit/projects/mytalentslab/mtl/frontend.git frontend`
* `git clone git@gitlab.com:wolfpackit/projects/mytalentslab/mtl/api-backend.git backend`

## Passport

To complete the setup for the backend, execute:

- `sudo docker exec mtl-php composer install`
- `sudo docker exec mtl-php php artisan key:generate`
- `sudo docker exec mtl-php php artisan passport:client --personal`
- `sudo docker exec mtl-php php artisan passport:install`

The last command is necessary to generate a pair of OAuth keys. These make it possible for users to log in.

## Definition of Done

A server setup can be considered completed when the following is possible and working:

- an administrator can log into the admin backend 
- a supervisor can log into the supervisor backend
- a user can log in via both the API and the front-end application
- the front-end application passes the initial "smoke test"