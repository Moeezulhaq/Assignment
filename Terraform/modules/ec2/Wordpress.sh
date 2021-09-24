#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install apache2
sudo systemctl status apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt install php php-mysql php-gd php-cli php-common -y
sudo apt install wget unzip -y
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo cp -r wordpress/* /var/www/html/
cd /var/www/html
sudo chown www-data:www-data -R /var/www/html/
sudo rm -rf index.html
sudo rm -rf wp-config.php
