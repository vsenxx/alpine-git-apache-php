FROM vsenxx/alpine-git-apache-php:base

RUN mkdir /run/apache2 && \
mkdir /app/web && \
mkdir /app/vhost && \
chown -R apache:apache /app && \
ln -s /app/vhost /etc/apache2/vhost
ADD scripts/vhost.conf /app/vhost/vhost.conf


RUN mkdir /scripts
ADD scripts/httpd.conf /etc/apache2/httpd.conf
ADD scripts/run.sh /scripts/run.sh
RUN mkdir /scripts/pre-exec.d && \
mkdir /scripts/pre-init.d && \
chmod -R 777 /scripts


RUN echo '<?php phpinfo();?>'>/app/web/index.php
EXPOSE 80
VOLUME /app
WORKDIR /app
ENTRYPOINT ["/bin/sh" , "/scripts/run.sh"]


