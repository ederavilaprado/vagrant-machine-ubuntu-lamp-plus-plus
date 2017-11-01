# Default Variables
DBHOST=localhost
DBNAME=db
DBUSER=dbuser
DBPASSWD=12345678

# Instalação geral
apt-get update
apt-get -y upgrade
apt-get -y install vim curl build-essential

# Instalando Apache
apt-get -y install apache2
echo "ServerName 192.168.33.10" >> /etc/apache2/apache2.conf
ufw allow in "Apache Full"

# Mapeando /var/www
rm -rf /var/www
ln -s /vagrant/var_www /var/www

# Instalando MySql com db defautl
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"
apt-get -y install mysql-server

mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"






################################################################






# debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
# debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD"
# debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD"
# debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD"
# debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
# apt-get -y install mysql-server phpmyadmin



# echo -e "\n--- Installing Composer for PHP package management ---\n"
# curl --silent https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer


# apt-get -y install nginx
# apt-get install php-fpm php-mysql
