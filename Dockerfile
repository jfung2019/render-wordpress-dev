FROM php:8.2-apache

# Install WordPress dependencies
RUN apt-get update && apt-get install -y \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Remove ALL MPM modules and configs
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load && \
    rm -f /etc/apache2/mods-enabled/mpm_*.conf

# Download WordPress
RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/wordpress.tar.gz

# Enable only prefork
RUN a2enmod mpm_prefork rewrite

WORKDIR /var/www/html
