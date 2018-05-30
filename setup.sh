#!/bin/bash

echo "Downloading dependencies"
composer install

echo "Set environment file"
cp .env.example .env;php artisan key:generate

echo "Set file permissions"
chown -R www-data:www-data /var/www/