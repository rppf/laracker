FROM php:7.1-fpm

RUN RUN apt-get update -y && apt-get install -y openssl zip unzip git nginx

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo mbstring

WORKDIR /var/www/

# Add Nginx configurations
ADD ./nginx.conf /opt/etc/nginx.conf
ADD ./vhost.conf /etc/nginx/conf.d/default.conf

# Add nginx startup script
ADD ./nginx-start.sh /opt/bin/nginx-start.sh
RUN chmod u=rwx /opt/bin/nginx-start.sh

# Add source code to working directory
COPY . /var/www/

# Expose ports
EXPOSE 443 80

WORKDIR /opt/bin

ENTRYPOINT ["/opt/bin/nginx-start.sh"]
