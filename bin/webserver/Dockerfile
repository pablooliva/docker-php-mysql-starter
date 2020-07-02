FROM php:7.2-apache

# Install important libraries
RUN apt-get update && apt-get install -y libpng-dev libpng-tools libpng16-16 zlib1g-dev zip unzip libicu-dev

# PECL Extensions xdebug
RUN apt-get update && apt-get install -y \
    && pecl install xdebug-2.7.2 \
    && docker-php-ext-enable xdebug

# Enable apache modules
RUN a2enmod rewrite

# Other PHP7 Extensions
RUN docker-php-ext-configure calendar \
    && docker-php-ext-install pdo_mysql gd zip calendar \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# Composer install dependencies, then run server
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
