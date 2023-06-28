# Inception

This project involves setting up a small infrastructure composed of different services under specific rules. The entire project is executed in a virtual machine using Docker Compose. Each service runs in a dedicated container, and each Docker image corresponds to its service.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites
Docker<br>
Docker Compose<br>
Virtual Machine<br>

## Installation

Clone the repository to your local machine.<br>
Navigate to the project directory.<br>
Create an .env inside the srcs folders like this:<br>
  
MYSQL_DATABASE=<br>
MYSQL_ROOT_PASSWORD=<br>
MYSQL_USER=<br>
MYSQL_PASSWORD=<br>
WORDPRESS_ADMIN_USER=<br>
WORDPRESS_TITLE=<br>
WORDPRESS_ADMIN_USER=<br>
WORDPRESS_ADMIN_PASSWORD=<br>
WORDPRESS_ADMIN_EMAIL=<br>
WORDPRESS_USER=<br>
WORDPRESS_EMAIL=<br>
WORDPRESS_PASSWORD=<br>

Run docker-compose up to start the containers.

## Project Structure
The project is composed of the following services:

NGINX: Runs in a Docker container with TLSv1.2 or TLSv1.3 only.<br>
WordPress + php-fpm: Runs in a Docker container without NGINX.<br>
MariaDB: Runs in a Docker container without NGINX.<br>
Volumes: One for the WordPress database and another for the WordPress website files.<br>
Docker-network: Establishes the connection between the containers.<br>
All containers are set to restart in case of a crash.<br>

## Built With
Docker<br>
Docker Compose<br>
NGINX<br>
WordPress<br>
MariaDB<br>
