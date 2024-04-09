#!/bin/bash

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www
mkdir /var/www/html
mkdir /var/www/html/wordpress
chmod -R 775 /var/www/html/wordpress

cd /var/www/html/wordpress

wp core download --allow-root --path=/var/www/html/wordpress

mv wp-config-sample.php wp-config.php

sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
sed -i "s/password_here/$MYSQL_PSW/g" wp-config.php
sed -i "s/localhost/mariadb:3306/g" wp-config.php
sed -i "s/database_name_here/$MYSQL_DB_NAME/g" wp-config.php

wp core install --allow-root \
        --url=$DOMAIN_NAME \
        --title=inception \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PSW \
        --admin_email=email@emailservice.org \
        --path=/var/www/html/wordpress

wp user create $WP_USER email@email.org --role=author --user_pass=$WP_USER_PSW --allow-root

mkdir /run/php
/usr/sbin/php-fpm7.4 -F