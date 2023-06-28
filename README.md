<h1>Inception<h1>

<h3>This project involves setting up a small infrastructure composed of different services under specific rules. The entire project is executed in a virtual machine using Docker Compose. Each service runs in a dedicated container, and each Docker image corresponds to its service.<h3>

<h2>Getting Started<h2>
<h3>These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.<h3>

<h2>Prerequisites<h2>
<h3>
Docker
Docker Compose
Virtual Machine
<h3>

<h2>Installation<h2>
<h3>
Clone the repository to your local machine.
Navigate to the project directory.
Create an .env inside the srcs folders like this:
  
MYSQL_DATABASE=
MYSQL_ROOT_PASSWORD=
MYSQL_USER=
MYSQL_PASSWORD=
WORDPRESS_ADMIN_USER=
WORDPRESS_TITLE=
WORDPRESS_ADMIN_USER=
WORDPRESS_ADMIN_PASSWORD=
WORDPRESS_ADMIN_EMAIL=
WORDPRESS_USER=
WORDPRESS_EMAIL=
WORDPRESS_PASSWORD=

Run docker-compose up to start the containers.
<h3>


<h2>Project Structure<h2>
<h3>
The project is composed of the following services:

NGINX: Runs in a Docker container with TLSv1.2 or TLSv1.3 only.
WordPress + php-fpm: Runs in a Docker container without NGINX.
MariaDB: Runs in a Docker container without NGINX.
Volumes: One for the WordPress database and another for the WordPress website files.
Docker-network: Establishes the connection between the containers.
All containers are set to restart in case of a crash.
<h3>
<h2>Built With<h2>
<h3>
Docker,
Docker Compose,
NGINX,
WordPress,
MariaDB
<h3>
