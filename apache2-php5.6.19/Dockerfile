FROM vsenxx/alpine-git
RUN apk --update add php-apache2 curl php-cli php-json php-phar php-openssl && rm -f /var/cache/apk/* && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
mkdir /app && chown -R apache:apache /app && \
sed -i 's#^DocumentRoot ".*#DocumentRoot "/app"#g' /etc/apache2/httpd.conf && \
sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
echo "Success"
RUN mkdir /scripts
ADD scripts/run.sh /scripts/run.sh
RUN mkdir /scripts/pre-exec.d && \
mkdir /scripts/pre-init.d && \
chmod -R 755 /scripts
EXPOSE 80
RUN mkdir /app
# VOLUME /app
WORKDIR /app
RUN echo "<?php phpinfo() ?>" > /app/index.php
ENTRYPOINT ["/bin/sh" , "/scripts/run.sh"]

