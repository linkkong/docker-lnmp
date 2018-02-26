#!/bin/bash

# set -x

# rm -rf /etc/default/locale
# env >> /etc/default/locale
/etc/init.d/cron start
php-fpm
# exec "$@"
