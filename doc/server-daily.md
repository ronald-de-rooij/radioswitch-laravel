# Deploying on servers

Every time a feature is finished in `develop` and ready for user testing you can access the `develop` server and deploy it.
It is recommended to do this early and often as this lets us spot issues with the software and the process.

## Manually deploy on develop, acceptance or production

A deployment does not require you to execute certain PHP commands manually. Those are done automatically,
for details check Docker configuration.

The following steps should be followed to deploy the current active branch on the server.

- SSH onto desired server
- `cd sites/backend`
- `git pull`
- `cd mtl-app`
- `sudo docker-compose --env-file ../src/.env down`
- `sudo docker-compose --env-file ../src/.env up -d --build`

This will rebuild the Docker images. Any migration statements will be executed automatically.

### Alias
To prevent repeating the same steps over and over, a alias can be used.
This alias is configured in `/home/wolfpack/.bashrc` and contains the following content:
```
restart(){
    cd /home/wolfpack/sites/backend/mtl-app
    sudo docker-compose --env-file ../src/.env down
    sudo docker-compose --env-file ../src/.env up --build $1 $2 $3
    }
```
Simply running the command `restart` will now execute above steps. 
In most cases you will need to run `restart -d` to ensure the docker containers start in detached mode.

Adding/editing aliases can be done at the same place. Note that an alias is only available for the user in which the `.bashrc` file is located.
Also for each edit of the file, you need to re-login to let changes take effect. 

## Rebooting the server

Rebooting should happen only when the rest of the team is aware and you can have someone looking over your shoulder.

The worst way to reboot is to do it alone; the worst time is to do it on a Friday afternoon.

To reboot, do:
- `sudo reboot`

Keep in mind that the Docker containers may not start automatically, which requires you to repeat the steps of a manual deploy.

## Restarting the proxy

In `sites/backend/proxy`, execute the following commands:

```
sudo docker-compose down
sudo docker-compose --env-file ../src/.env up -d
```

This is necessary when a new subdomain is added.