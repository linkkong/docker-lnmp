FROM php:7.2-fpm

ENV TZ=Asia/Shanghai
RUN set -xe \
    && echo "安装 php 以及编译构建组件所需包" \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get update 
RUN apt-get install wget git python-setuptools python-dev vim cron build-essential libfreetype6-dev libjpeg-dev libpng-dev -y libxml2-dev\
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure soap \
    && easy_install supervisor && echo_supervisord_conf > /etc/supervisord.conf \
    && wget https://xdebug.org/files/xdebug-2.6.1.tgz \
    && tar zxvf xdebug-2.6.1.tgz && cd xdebug-2.6.1 \
    && phpize && ./configure --enable-xdebug && make clean && make && make install \
    && docker-php-ext-enable xdebug
RUN docker-php-ext-install iconv mysqli pdo pdo_mysql zip gd bcmath soap\
    # && pecl install mongodb && docker-php-ext-enable mongodb \
    && wget https://getcomposer.org/composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && composer global require "laravel/installer" 
RUN echo "export PATH=$PATH:~/.composer/vendor/bin" >> ~/.bashrc \
    && echo "清理" \
    && apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false \
        -o APT::AutoRemove::SuggestsImportant=false \
        $buildDeps \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && touch /entrypoint.sh \
    && mkdir /home/supervisor
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
CMD ["sh","-c","/entrypoint.sh"]
