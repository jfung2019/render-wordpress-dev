FROM wordpress:php8.2-fpm-alpine

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.d/www.conf

RUN echo '#!/bin/sh\n\
if [ ! -f /var/www/html/index.php ]; then\n\
  cp -r /usr/src/wordpress/* /var/www/html/\n\
fi\n\
php-fpm' > /entrypoint.sh && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
