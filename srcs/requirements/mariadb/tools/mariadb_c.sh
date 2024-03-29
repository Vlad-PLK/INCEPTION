#!/bin/sh

MYSQL_DB_NAME="mariadb"
MYSQL_ROOT_PSW="vlplk"
MYSQL_USER="vlad"
MYSQL_PSW="vld"

echo "FLUSH PRIVILEGES;" | mariadbd --bootstrap --user=root
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB_NAME}\`;" | mariadbd --bootstrap --user=root
echo "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PSW}';" | mariadbd --bootstrap --user=root
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';" | mariadbd --bootstrap --user=root
echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PSW}';" | mariadbd --bootstrap --user=root

kill %1

mariadbd --bootstrap --user=root & 
sleep 3
##service mariadb start
##
##touch db.sql
##cat << EOF > db.sql
##CREATE DATABASE IF NOT EXISTS mdb;
##CREATE USER IF NOT EXISTS plk@'localhost' IDENTIFIED BY 'vld';
##GRANT ALL PRIVILEGES ON mdb.* TO plk@'%' IDENTIFIED BY 'vld';
##ALTER USER 'root'@'localhost' IDENTIFIED BY 'vldplk';
##FLUSH PRIVILEGES;
##EOF
##
##mariadb < db.sql
##
##mysqladmin -u root -p'vldplk' shutdown
##