#!/bin/bash
chown -R www-data:www-data /var/www/html
nginx -g "daemon off;"
/etc/init.d/php7.3-fpm start

