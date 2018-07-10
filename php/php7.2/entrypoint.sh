#!/bin/bash

# set -x

# rm -rf /etc/default/locale
# env >> /etc/default/locale
/etc/init.d/cron start
service supervisor restart
php-fpm -c /usr/local/etc/php-fpm.ini
# exec "$@"
