FROM debian:buster

#installing php extensions for Wordpress
#PHP-FPM		-> "PHP FastCGI Process Manager
#php-mysql		-> driver that allows PHP to communicate with MYSQL,
#				-> it is a php extension that provides support for accessing 
#				-> MYSQL databases from PHP
#mariadb-client -> package installed so the container can communicate with the
#				-> Mariadb database server

RUN apt-get update &&\
	apt-get install -y wget\
	php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

#installing the WP-CLI tool, which is a command-line interface for managing Worpress installations
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#Copying the wordpress installtion script and the config file
COPY ./tools/auto_config.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Specifying the auto_config.sh script should be executed when the container starts up
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

