# m1-wp-docker
This repo contains a setup where you can work with Macbook M1s with a containerized setup. Setups such as Lando, Warded among others dont support M1 yet and I got tired of performance issues by using their setup.

It should work for any OS/Architecture as long as they are supported by the official images for the below containers:

This setup is using
- Traefik 2.4
- Mariadb Latest
- Nginx 1.19
- PHP-FPM 7.4
- PhpMyAdmin at port 9000
- Self generated SSL certs so that you can use HTTPS locally

## Prerequisites
This is docker-composer based setup and you must have that installed in order to use this setup. You can find more info about it here: https://docs.docker.com/compose/install/

## Setup
In order to use docker you need to run:

`docker-compose up --build -d`

You need to provide `WP_DOMAIN` in the `.env` for docker compose to pick that host up.

Set your /etc/hosts to whatever `WP_DOMAIN` you set, ie : `127.0.0.1 domain.test`

Place any `backup.sql` in the db directory and it should automatically be copied and imported when starting the container.

## Nginx
My setup is based on the bedrock / Sage setup where you have composer in root and look at the `/web` dir for nginx. Thus its important that if you dont go the sage way you still need to put all files in the `web/` dir. Or change the config file in `/docker-files/nginx/default.conf`: `root /var/www/html/web;` to whatever you put your files in.

## Important when it comes to MYSQL
Note that if the mysql dir is not empty, the setup will not create a new database. Ie. Remove any files in `docker-files/mysql` if you wish to recreate the db or do a new import of the database

The import takes a couple of minutes on the first startup. If you close down the container before the import has finished you need to empty and recreate the mysql container in order for it to import the database.

You cant runt the import twice, only once. However if you want to you can always change the symlink to another name, then it will pick it up.
