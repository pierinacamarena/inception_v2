#!/bin/bash

set -eux

if [ ! -f "/var/www/wordpress/chech_install" ]; then
	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && \
	rm wordpress-6.0-fr_FR.tar.gz

	touch /var/www/wordpress/chech_install
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

if [ ! -f /var/www/wordpress/admin_chech ]; then
	wp core install --allow-root --url="$WORDPRESS_ADMIN_USER".42.fr \
		--title="$WORDPRESS_TITLE" \
		--admin_user="$WORDPRESS_ADMIN_USER" \
		--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
		--admin_email="$WORDPRESS_ADMIN_EMAIL" \
		--path='/var/www/wordpress'
	touch /var/www/wordpress/admin_chech
fi
#create a second user that is not administrator
if [ ! -f /var/www/wordpress/user_chech ]; then
	wp user create --allow-root "$WORDPRESS_USER" "$WORDPRESS_EMAIL" \
		--user_pass="$WORDPRESS_PASSWORD" \
		--path='/var/www/wordpress'

	touch /var/www/wordpress/user_chech
fi

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F