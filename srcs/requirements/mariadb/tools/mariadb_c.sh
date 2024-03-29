#!/bin/sh

set -x

sed -i 's/# port = 3306/port = 3306/' /etc/mysql/mariadb.cnf
sed -i 's/127.0.0.1/0.0.0.0/'         /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mysqladmin -u root password "$MYSQL_ROOT_PSW"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PSW';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"
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