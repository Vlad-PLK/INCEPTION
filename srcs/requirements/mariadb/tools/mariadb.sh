#!/bin/sh

service mariadb start

touch db.sql
cat << EOF > db.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';
GRANT ALL PRIVILEGES ON wordpress.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';
ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PSW}';
EOF

mariadb < db.sql

mariadb-admin -u root -p${MYSQL_ROOT_PSW} shutdown
