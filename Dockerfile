FROM php:7.2.2-apache
# Comment out for local development
COPY ./app /var/www/html
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite