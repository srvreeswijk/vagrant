# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:latest

LABEL maintainer="sebastiaan.vreeswijk@vialis.nl"
LABEL version="0.1"

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid

RUN /bin/mkdir $APACHE_LOCK_DIR
RUN /bin/mkdir APACHE_PID_FILE

EXPOSE 80

COPY ./public-html/ /var/www/html

CMD /usr/sbin/apache2ctl -D FOREGROUND
