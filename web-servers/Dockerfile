FROM ubuntu:latest

MAINTAINER Zaytsev Denis <zayden@mail.ru>

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx

RUN ln -sf /dev/stdout /var/log/nginx/$HOSTNAME-access.log \
        && ln -sf /dev/stderr /var/log/nginx/$HOSTNAME-error.log

EXPOSE 80

CMD /usr/sbin/nginx
