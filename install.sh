#!/bin/sh
echo "start..."
sudo apt-get update
sudo apt-get upgrade

#util
sudo apt install -y curl wget mc

#ansible
sudo apt install -y ansible
ansible-galaxy collection install community.postgresql
ansible-galaxy collection install community.postgresql --upgrade
ansible-galaxy install geerlingguy.memcached
ansible-galaxy install geerlingguy.memcached --upgrade

#php
sudo apt install -y php8.1
sudo apt-get install memcached
sudo apt-get install -y php8.1-cli php8.1-common php8.1-pgsql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath php8.1-memcached


#composer

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#postgres
sudo apt install -y postgresql
sudo systemctl is-active postgresql
sudo systemctl is-enabled postgresql
sudo systemctl status postgresql
sudo pg_isready

#postgres admin
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo /usr/pgadmin4/bin/setup-web.sh



