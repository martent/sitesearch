#!/usr/bin/env bash

echo User `whoami` is provisioning

function install {
    echo installing $1
    shift
    apt-get -y install "$@"
}

echo "Adding Postgres repo"
add-apt-repository -y "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

echo "Adding ElasticSearch repo"
add-apt-repository -y "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
wget --quiet -O - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

echo "Upgrading packages"
apt-get -y update >/dev/null 2>&1
apt-get -y upgrade >/dev/null 2>&1

install 'development tools' build-essential
install Git git
install memcached memcached
install "JDK" default-jdk
install ElasticSearch elasticsearch

echo "Set locale for Postgres"
update-locale LANG=sv_SE.UTF-8 LANGUAGE=sv_SE.UTF-8 LC_ALL=sv_SE.UTF-8

install "PostgreSQL" postgresql postgresql-client postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres createdb -O vagrant sitesearch_development --encoding=UTF8 --locale=sv_SE.UTF-8
sudo -u postgres createdb -O vagrant sitesearch_test --encoding=UTF8 --locale=sv_SE.UTF-8

echo "Reset locale"
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo "Adding MySQL"
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
install MySQL mysql-server libmysqlclient-dev
mysql -uroot -proot <<SQL
CREATE USER 'sitesearch'@'localhost';
CREATE DATABASE sitesearch  DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_swedish_ci;
GRANT ALL PRIVILEGES ON sitesearch.* to 'sitesearch'@'localhost';
SQL

install "nodejs" nodejs npm
install "phantomjs, for specs" phantomjs
install "Ruby dependencies" libreadline-dev libffi-dev

echo "Setting ElasticSearch to boot on startup"
update-rc.d elasticsearch defaults 95 10
/etc/init.d/elasticsearch start
