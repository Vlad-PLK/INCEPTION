#!/bin/sh

service mariadb start

touch db.sql
cat << EOF > db.sql
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB_NAME}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PSW}';
ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PSW}';
FLUSH PRIVILEGES;
EOF

mariadb < db.sql

mysqladmin -u root -p'vldplk' shutdown
