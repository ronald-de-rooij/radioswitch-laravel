#! /bin/sh

SCRIPT_DIRECTORY=$(cd $(dirname $0) && pwd)
cd "${SCRIPT_DIRECTORY}" || exit

cd ../..

if [ -z "$(ls -A src)" ]; then
  #PWD SET TO PARENT FOLDER TO PREVENT NON EMPTY ERROR ON CREATE-PROJECT
  /usr/bin/composer create-project laravel/laravel src
else
  echo 'Skipping fresh laravel import, "src" folder is not empty'
  read -p "Do you want to continue (y/n)? This will overwrite your (already) configured environment files! Includes files are: .env, gitlab-ci.yml and docker.env [n]: " var
  if [ "$var" != "${var#[Yy]}" ] ;then
      echo 'Env files will be overwritten!'
  else
      echo 'Canceling..'
      exit 1
  fi
fi

cd "${SCRIPT_DIRECTORY}" || exit
DOCKER_USER=$(id -u)":"$(id -g)
export DOCKER_USER

read -p "Enter application name [Laravel]: " var
APP_NAME=${var:-Laravel}
echo "${APP_NAME}"
export APP_NAME

read -p "Enter application url [app.test]: " var
APP_URL=${var:-app.test}
echo "${APP_URL}"
export APP_URL

read -p "Enter database name [app]: " var
DB_DATABASE=${var:-app}
echo "${DB_DATABASE}"
export DB_DATABASE

read -p "Enter database user [postgres]: " var
DB_USERNAME=${var:-postgres}
echo "${DB_USERNAME}"
export DB_USERNAME

read -p "Enter database password [postgres]: " var
DB_PASSWORD=${var:-postgres}
echo "${DB_PASSWORD}"
export DB_PASSWORD

read -p "Enter email address set as from [noreply@app.nl]: " var
EMAIL_FROM_ADDRESS=${var:-noreply@app.nl}
echo "${EMAIL_FROM_ADDRESS}"
export EMAIL_FROM_ADDRESS

echo "Replacing env variables in template"
envsubst < general-stub.env > tmpfile
sh env-merge.sh ../../src/.env tmpfile
rm tmpfile

echo "Create docker.env file"
cp ../docker.env.example ../docker.env

echo "Create fresh .gitignore"
cp .gitignore ../../src

echo "Create default .gitlab-ci"
cp .gitlab-ci.yml ../../src
