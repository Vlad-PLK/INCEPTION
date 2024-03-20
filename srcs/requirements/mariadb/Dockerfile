FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh /

CMD sh /mariadb.sh