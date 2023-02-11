FROM debian:buster

RUN apt-get update &&\
	apt-get install -y wget\
	php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN rm -rf /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/auto_config.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

