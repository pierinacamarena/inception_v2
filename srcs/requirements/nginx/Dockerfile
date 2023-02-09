FROM debian:buster

LABEL maintainer="pcamaren@student.42.fr"

RUN	apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

#to use the TLSv1.3 or TLSv1.2 protocol I need to create an SSL certificate and key pair:
#for this purpose the openssl command-line tool can be used
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/pcamaren.crt \
		-keyout /etc/nginx/ssl/pcamaren.key \
		-subj "/C=FR/ST=IleDeFrance/L=Paris/O=Ecole42/OU=pcamaren/CN=pcamaren.42.fr" 


#Copy the nginx configuration file
#nginx.conf is the main configuration file for the Nginx web server
#copying a local version of the nginx.conf file to the container
#you can customize the server's configuration without having to rebuild
#the image
COPY ./conf/nginx.conf /etc/nginx/conf.d

#expose port 443 (only port allowed) to allow incoming corrections
#EXPOSE 80
EXPOSE 443

#RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
#RUN chown -R www-data:www-data /var/www/html

#start Nginx when the container is run 
CMD ["nginx", "-g", "daemon off;"]
