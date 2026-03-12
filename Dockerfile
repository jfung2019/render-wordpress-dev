FROM wordpress:php8.2-fpm-alpine

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.d/www.conf

# Copy WordPress source to a backup location
RUN cp -r /usr/src/wordpress /wordpress-src

# Create init script
RUN echo '#!/bin/sh\nif [ ! -f /var/www/html/index.php ]; then cp -r /wordpress-src/* /var/www/html/; fi\nexec php-fpm' > /init.sh && chmod +x /init.sh

CMD ["/init.sh"]
