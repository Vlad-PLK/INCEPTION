#!/bin/sh

#service mariadb start

mariadbd & 
sleep 3
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB_NAME}\`;" | mariadb
echo "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';" | mariadb
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';" | mariadb
echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PSW}';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb

kill %1

#mysqladmin -u root -p$MYSQL_ROOT_PSW shutdown
