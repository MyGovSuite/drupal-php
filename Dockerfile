ARG PHP_TAG=7.4-fpm

FROM php:$PHP_TAG

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# PHP extension requirements https://git.drupalcode.org/project/drupal/-/blob/8.9.x/core/composer.json
RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd