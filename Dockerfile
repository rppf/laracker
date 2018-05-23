FROM php:alpine
LABEL maintainer="hitalos <hitalos@gmail.com>"

USER root

RUN apk update && apk upgrade && apk add bash git

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
RUN /usr/sbin/install-php.sh

RUN mv .env.example .env && php artisan key:generate

# Download and install NodeJS
ENV NODE_VERSION 10.0.0
ADD install-node.sh /usr/sbin/install-node.sh
RUN sudo /usr/sbin/install-node.sh
RUN npm i -g yarn

RUN mkdir -p /etc/ssl/certs && update-ca-certificates

WORKDIR /var/www

RUN composer install
