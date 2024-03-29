#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www
mkdir /var/www/html
mkdir /var/www/html/wordpress

cd /var/www/html/wordpress

wp core download --allow-root

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PSW/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DB_NAME/g" wp-config-sample.php

mv wp-config-sample.php wp-config.php

wp core install --url=$DOMAIN_NAME --title=42 --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN.42.fr --skip-email --allow-root
wp user create $WP_USER --user_pass=$WP_USER_PSW --role=author --allow-root

mkdir /run/php