ARG PHP_TAG

FROM php:$PHP_TAG

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# PHP extension requirements https://git.drupalcode.org/project/drupal/-/blob/8.9.x/core/composer.json
RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd

RUN apt update && \
    apt install -y unzip wget && \
    wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer