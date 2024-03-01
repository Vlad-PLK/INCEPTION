FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y
RUN apt install curl -y
RUN apt install vim -y

COPY /conf/nginx.conf /etc/nginx/conf