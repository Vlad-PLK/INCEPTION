#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /wp-config-sample.php /wp-config.php

sed -i 's/database_name_here/$MYSQL_DB_NAME/1' /wp-config.php
sed -i 's/username_here/$MYSQL_USER/1' /wp-config.php
sed -i 's/password_here/$MYSQL_PSW/1' /wp-config.php
sed -i 's/localhost/mariadb/1' /wp-config.php
