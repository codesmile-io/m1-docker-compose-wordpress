FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli

RUN docker-php-ext-configure opcache --enable-opcache \
  && docker-php-ext-install opcache

# SETUP PHP-FPM CONFIG SETTINGS (max_children / max_requests)
RUN echo 'pm.max_children = 15' >> /usr/local/etc/php-fpm.d/zz-docker.conf && \
  echo 'pm.max_requests = 500' >> /usr/local/etc/php-fpm.d/zz-docker.conf
