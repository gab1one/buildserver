#!/bin/bash

# Variables
DB_ROOTPW=pw

DB_NAME=sonar
DB_USER=sonar
DB_PW=sonar

echo -e "\n--- Installing now... ---\n"

sudo -i
apt-get update
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins vim git htop -y

echo -e "\n--- Install MySQL specific packages and settings ---\n"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOTPW"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOTPW"
# echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
# echo "phpmyadmin phpmyadmin/app-password-confirm password $DB_ADMIN_PW" | debconf-set-selections
# echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DB_ADMIN_PW" | debconf-set-selections
# echo "phpmyadmin phpmyadmin/mysql/app-pass password $DB_ADMIN_PW" | debconf-set-selections
# echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections

apt-get -y install mysql-server-5.5

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DB_ROOTPW -e "CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci"
mysql -uroot -p$DB_ROOTPW -e "grant all privileges on sonar.* to 'sonar'@'localhost' identified by 'sonar'"
mysql -uroot -p$DB_ROOTPW -e "FLUSH PRIVILEGES;"
