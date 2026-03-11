FROM wordpress:latest

# Keep Apache stable for WP (safe on Render; avoids rare MPM conflicts on some PaaS)
RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2dismod mpm_itk || true \
 && a2enmod mpm_prefork \
 && a2enmod rewrite
