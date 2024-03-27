#!/bin/sh

service mariadb start

touch db.sql
cat << EOF > db.sql
CREATE DATABASE IF NOT EXISTS mdb;
CREATE USER IF NOT EXISTS plk@'localhost' IDENTIFIED BY 'vld';
GRANT ALL PRIVILEGES ON mdb.* TO plk@'%' IDENTIFIED BY 'vld';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'vldplk';
FLUSH PRIVILEGES;
EOF

mariadb < db.sql

mysqladmin -u root -p'vldplk' shutdown
