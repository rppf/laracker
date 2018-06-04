#!/bin/bash

echo -e "Downloading dependencies \e[1mBold"
composer install

echo -e "Set environment file \e[1mBold"
cp .env.example .env;php artisan key:generate

echo -e "Set file permissions \e[1mBold"
chown -R www-data:www-data /var/www/

echo -e "Success \e[1mBold \e[32mGreen"
