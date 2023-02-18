FROM debian:buster

RUN apt-get update
RUN apt-get -y install mariadb-server mariadb-client

#create mysql service directory to store date related to the mysql service,
#such as configuration files, logs, and data files
#we do this to help keep the service data organized
#and separate from other system data, to make it easier to manage and backup
RUN mkdir -p /run/mysqld /var/lib/mysql\
	&& chown -R mysql:mysql /run/mysqld /var/lib/mysql 

#mysql_install_db, script provided by the mysql package that is used to initialize
#the directory for a mysql database server
#It creates the necessary system tables, initializes the data directory, and sets up
#the root user with a default password

#when the docker image is built from this dockerfile
#the directory will be initialized and ready for use 
#when a container is started from the image
#--skip-test-db is to skip the creation of the test database
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db

#Copy the my.cnf file into the directory /etc/mysql/, in the my.cnf file we specify the port and set
#bind-address=0.0.0.0 to allow the mariadb server to listen for connections from any IP address, including
#the IP addresses from other containers and the host machine
COPY ./conf/my.cnf /etc/mysql/my.cnf

# MariaDB installation script is imported in /usr/local/bin to be executed as entrypoint
COPY ./tools/auto_config.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

#The mysqld_safe script is used to start the MySQL daemon, mysqld,
#in a safe manner by automatically restarting the daemon if it crashes or if there are any other issues.#The --datadir option specifies the directory where the MySQL data will be stored. 
CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]