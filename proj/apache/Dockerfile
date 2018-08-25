FROM php:7.2-apache

RUN docker-php-ext-install -j$(nproc) mysqli
COPY index.php /var/www/html
