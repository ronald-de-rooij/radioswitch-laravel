#!/bin/bash

cd -P -- "$(dirname -- "$0")" && pwd -P| exit

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

#tmpfile=$(mktemp /tmp/temp.env)
#envsubst < general-stub.env > tmpfile
t= envsubst < general-stub.env
echo $t
sh env-merge.sh $t ../../src/.env ./test.env

cp .gitignore ../../src