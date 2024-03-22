FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install curl -y

COPY wp_script.sh /

#RUN sh wp_script.sh