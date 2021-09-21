#!/bin/bash
# shellcheck disable=SC2046
SCRIPT_DIRECTORY=$(cd $(dirname $0) && pwd)
cd "${SCRIPT_DIRECTORY}" || exit

cd ../..
if [ -z "$(ls -A src)" ]; then
  #PWD SET TO PARENT FOLDER TO PREVENT NON EMPTY ERROR ON CREATE-PROJECT
  docker run --rm \
  -v $PWD:/app \
  -u $(id -u):$(id -g) \
  composer composer create-project laravel/laravel src

else
  echo 'Skipping fresh laravel import, "src" folder is not empty'
fi

cd "${SCRIPT_DIRECTORY}" || exit

echo ${PWD}
read -p "Enter application name [Laravel]: " var
APP_NAME=${var:-Laravel}
echo "${APP_NAME}"
export APP_NAME

read -p "Enter application url [app.test]: " var
APP_URL=${var:-app.test}
echo "${APP_URL}"
export APP_URL

read -p "Enter database name [app]: " var
DB_NAME=${var:-app}
echo "${DB_NAME}"
export DB_NAME

read -p "Enter database user [postgres]: " var
DB_USER=${var:-postgres}
echo "${DB_USER}"
export DB_USER

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
cp ../../src/.env fresh.env
sh env-merge.sh ../../src/.env tmpfile
rm tmpfile

echo "Create fresh .gitignore"
cp .gitignore ../../src

cd .. | exit
echo "Create docker.env file"
cp app/docker.env.example app/docker.env