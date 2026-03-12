
FROM wordpress:latest
# Keep Apache stable; enable rewrite for permalinks
RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2dismod mpm_itk || true \
 && a2enmod mpm_prefork \
 && a2enmod rewrite
