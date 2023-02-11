#!/bin/bash

set -eux

if [ ! -d "/var/www/wordpress" ]; then
	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && \
	rm wordpress-6.0-fr_FR.tar.gz

	chown -R root:root /var/www/wordpress
else
	echo "wordpress already installed"
fi

sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	wp config create --allow-root \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'
else
	echo "wp-config.php already exists"
fi

#check if there are the following users 
#create a new user that is the administrator
ADMIN_USER=$( eval "wp user get $WORDPRESS_ADMIN_USER --field=login" )
WP_USER=$( eval "wp user get $WORDPRESS_USER --field=login" )

if [ "$WORDPRESS_ADMIN_USER" -ne "$ADMIN_USER" ]; then
	wp core install --url="$WORDPRESS_ADMIN_USER".42.fr \
		--title="$WORDPRESS_TITLE" \
		--admin_user="$WORDPRESS_ADMIN_USER" \
		--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
		--admin_email="$WORDPRESS_ADMIN_EMAIL"
fi
#create a second user that is not administrator
if [ "$WORDPRESS_USER" -ne "$WP_USER" ]; then
	wp user create "$WORDPRESS_USER" "$WORDPRESS_EMAIL" \
		--password="$WORDPRESS_PASSWORD" 
fi

mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F