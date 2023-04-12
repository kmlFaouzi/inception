#!/bin/sh
wp config set DB_NAME $DB_NAME --path=/var/www/ --allow-root
wp config set DB_USER $DB_USER --path=/var/www/ --allow-root
wp config set DB_PASSWORD $USER_PASSWORD --path=/var/www/ --allow-root
wp config set DB_HOST $DB_HOST --path=/var/www/ --allow-root
/usr/sbin/php-fpm7.4 -F