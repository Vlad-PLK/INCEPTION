FROM debian:bullseye

ARG DOMAIN_NAME
ARG WP_ADMIN
ARG WP_ADMIN_PSW
ARG WP_USER
ARG WP_USER_PSW
ARG MYSQL_DB_NAME
ARG MYSQL_USER
ARG MYSQL_ROOT_PSW

RUN apt update -y && apt upgrade -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install curl -y

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY wp_script.sh /

RUN sh wp_script.sh