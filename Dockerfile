FROM wordpress:php8.2-fpm-alpine

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.d/www.conf

# Create entrypoint script
RUN mkdir -p /usr/local/bin && \
    echo '#!/bin/sh' > /usr/local/bin/docker-entrypoint.sh && \
    echo 'if [ ! -f /var/www/html/index.php ]; then' >> /usr/local/bin/docker-entrypoint.sh && \
    echo '  echo "Copying WordPress files..."' >> /usr/local/bin/docker-entrypoint.sh && \
    echo '  cp -r /usr/src/wordpress/* /var/www/html/' >> /usr/local/bin/docker-entrypoint.sh && \
    echo 'fi' >> /usr/local/bin/docker-entrypoint.sh && \
    echo 'exec php-fpm' >> /usr/local/bin/docker-entrypoint.sh && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
