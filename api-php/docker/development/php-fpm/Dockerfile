FROM php:8.1.18-fpm-alpine3.17

COPY ./common/php/conf.d /usr/local/etc/php/conf.d

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

WORKDIR /app
