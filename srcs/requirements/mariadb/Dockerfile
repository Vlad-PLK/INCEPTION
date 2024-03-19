FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN mkdir /var/run/mysqld/ && chown mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf/50-server.cnf
COPY tools/mariadb.sh /var/local/

CMD sh /var/local/mariadb.sh