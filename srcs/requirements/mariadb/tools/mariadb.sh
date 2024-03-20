#!/bin/sh

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" | mariadb
echo "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" | mariadb
echo "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" | mariadb
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
