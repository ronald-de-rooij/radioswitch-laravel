# Deploying on servers

Migration is executed automatically. In some cases, you may want to add information to the database as a one-time
operation.

To do this, write a new [Command](https://laravel.com/docs/artisan). An example of such a command is the `MailTest`.
It's possible to execute this on the server by using the `artisan.sh` script in
the [infra repository](). #TODO update url