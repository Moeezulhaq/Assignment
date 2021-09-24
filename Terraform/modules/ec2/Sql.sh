#!/bin/bash
set -x
sudo apt update -y
sudo apt upgrade -y
sudo apt install mysql-server -y
sudo mysql -u root 
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
exit;
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql