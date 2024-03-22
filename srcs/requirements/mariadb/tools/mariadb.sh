#!/bin/sh

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB_NAME}\`;" | mariadb
echo "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PSW}';" | mariadb
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';" | mariadb
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PSW}';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb
mysqladmin -u root -p$MYSQL_ROOT_PSW shutdown
exec mysqld_safe
