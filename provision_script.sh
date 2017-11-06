# Default Variables
# DBHOST=localhost
# DBNAME=db
# DBUSER=dbuser
# DBPASSWD=12345678

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

# # Instalando e configurando MySql como db defautl
# debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
# debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"
# apt-get -y install mysql-server
# mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
# mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"


# Instalando PHP
apt-get -y install php libapache2-mod-php php-curl php-mcrypt php-mysql php-gd php-gettext php-memcached php-cli

# Instalando composer para PHP
curl --silent https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Instalando mod_rewrite para php
a2enmod rewrite

# Allowing Apache override to all
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

# Alterando para exibir os erros do PHP no browser
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini

# Reiniciando o Apache para aplicar todas as configs
systemctl restart apache2






################################################################


# apt-get -y install nginx
# apt-get install php-fpm php-mysql
