FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install curl -y

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY wp_script.sh /

RUN sudo service php7.4-fpm start
RUN sh wp_script.sh