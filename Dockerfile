FROM php:alpine
LABEL maintainer="hitalos <hitalos@gmail.com>"

RUN apk update && apk upgrade && apk add bash git

COPY composer.lock composer.json /var/www/

COPY .env.example /var/www

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
RUN chmod +x /usr/sbin/install-php.sh && /usr/sbin/install-php.sh

# Download and install NodeJS
ENV NODE_VERSION 10.0.0
ADD install-node.sh /usr/sbin/install-node.sh
RUN chmod +x /usr/sbin/install-node.sh && /usr/sbin/install-node.sh
RUN npm i -g yarn

WORKDIR /var/www

COPY . /var/www

RUN mv .env.example .env

RUN composer install
