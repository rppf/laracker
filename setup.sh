#!/bin/bash

echo "Downloading dependencies \e[1mBold"
composer install

echo "Set environment file \e[1mBold"
cp .env.example .env;php artisan key:generate

echo "Set file permissions \e[1mBold"
chown -R www-data:www-data /var/www/

echo "Success \e[1mBold \e[32mGreen"
