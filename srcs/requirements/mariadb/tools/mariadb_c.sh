#!/bin/sh

service mariadb start

#mariadbd & 
#sleep 3
cat << EOF > mb.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS mdb;
CREATE USER IF NOT EXISTS plk@'localhost' IDENTIFIED BY 'vld';
GRANT ALL PRIVILEGES ON mdb.* TO plk@'%' IDENTIFIED BY 'vld';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'vldplk';
FLUSH PRIVILEGES;
EOF

mariadb < mb.sql
#kill %1

service mariadb stop

#mysqladmin -u root -p$MYSQL_ROOT_PSW shutdown
