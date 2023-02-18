#!/bin/bash

set -eux

#Installation of wordpress
if [ ! -f "/var/www/wordpress/chech_install" ]; then
	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && \
	rm wordpress-6.0-fr_FR.tar.gz

	touch /var/www/wordpress/chech_install
	chown -R root:root /var/www/wordpress
else
	echo "wordpress already installed"
fi

#waiting for the maria db database to become available
sleep 10

#create wp-config.php file to connect Wordpress with MariaDB
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

#set ownership of /var/www directory to www-data user and group
chown -R www-data:www-data /var/www/*
#set permissions of /var/www directory to www-data user and group
chmod -R 755 /var/www/*

#create directory for the php-fpm to communicate with the web server to handle php requests
mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F