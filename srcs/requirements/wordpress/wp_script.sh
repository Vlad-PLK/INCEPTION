#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www/html/wordpress

cd /var/www/html/wordpress

wp core download --allow-root

mv /wp-config-sample.php /wp-config.php

sed -i 's/database_name_here/$MYSQL_DB_NAME/1' /wp-config.php
sed -i 's/username_here/$MYSQL_USER/1' /wp-config.php
sed -i 's/password_here/$MYSQL_PSW/1' /wp-config.php
sed -i 's/localhost/mariadb/1' /wp-config.php

wp core config --url=https://vpolojie.42.fr --title=42 --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN.42.fr --skip-email --allow-root