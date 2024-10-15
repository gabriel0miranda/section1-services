FROM php:8.2-fpm-alpine

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
COPY configs/baikal-php.ini /usr/local/etc/php/conf.d/custom.ini

RUN apk --no-cache update && \
    apk --no-cache --virtual add nginx zip supervisor

RUN mkdir /usr/share/nginx/html && \
    wget https://github.com/sabre-io/Baikal/releases/download/0.9.5/baikal-0.9.5.zip -O /usr/share/nginx/html/baikal.zip && \
    unzip /usr/share/nginx/html/baikal.zip -d /usr/share/nginx/html/

RUN chown -R www-data:www-data /usr/share/nginx/html

COPY configs/baikal-fpm.conf /usr/local/etc/php-fpm.d/zz-docker.conf

COPY configs/baikal-nginx.conf /etc/nginx/conf.d/default.conf

COPY supervisor/baikal.conf /etc/baikal.conf

COPY scripts/baikal-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

RUN chown -R www-data:www-data /var/log/nginx /run/ /usr/lib/nginx /run/nginx /var/lib/nginx

EXPOSE 80

USER www-data

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/baikal.conf"]
