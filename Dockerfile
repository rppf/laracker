FROM php:7.1-fpm

RUN apt-get update -y && apt-get install -y openssl zip unzip git nginx

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo mbstring

WORKDIR /var/www/

# Add source code to working directory
COPY . /var/www/

# Add Nginx configurations
RUN rm /etc/nginx/sites-enabled/default
ADD ./vhost.conf /etc/nginx/conf.d/default.conf

RUN chmod +x ./run

ENTRYPOINT ["./run"]

# Expose ports
EXPOSE 443 80
