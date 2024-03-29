FROM debian:bullseye

ARG MYSQL_DB_NAME
ARG MYSQL_ROOT_PSW
ARG MYSQL_USER
ARG MYSQL_PSW

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb_c.sh /

RUN chmod +x mariadb_c.sh
RUN ./mariadb_c.sh
CMD ["mariadbd"]