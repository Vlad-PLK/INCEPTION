#!/bin/sh

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS db;"
mysql -e "CREATE USER IF NOT EXISTS vld@'localhost' IDENTIFIED BY 'plk';"
mysql -e "GRANT ALL PRIVILEGES ON db.* TO vld@'%' IDENTIFIED BY 'plk';"
mysql -e "ALTER USER root@'localhost' IDENTIFIED BY 'vldplk';"
mysql -e "FLUSH PRIVILEGES;" -u root -pvldplk
mysqladmin -u root -pvldplk shutdown
exec mysqld_safe
