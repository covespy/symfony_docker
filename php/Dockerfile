FROM php:8.0-fpm

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    lua5.4 wget nodejs npm \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /var/www/symfony
RUN usermod -u 1000 www-data
RUN mkdir -p /usr/share/static/css \
		/usr/share/static/js
RUN wget -O /usr/share/static/css/bootstrap.min.css \
    https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css
RUN wget -O /usr/share/static/js/bootstrap.bundle.min.js \
    https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN git config --global user.email "aestark01@yahoo.com" \
    && git config --global user.name "aes"
RUN symfony new .
Run composer req doctrine twig
RUN composer req --dev maker ormfixtures fakerphp/faker
RUN cp .env .env.local
RUN sed -i 's,^DATABASE_URL=.*,DATABASE_URL="mysql://root:dbsecret@database:3306/symfony?serverVersion=8.0",g' .env.local
RUN --mount=type=secret,id=db-password cat /run/secrets/db-password | xargs --replace=INSERTED -- sed -i 's,dbsecret,INSERTED,g' .env.local
