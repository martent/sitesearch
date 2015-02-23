#!/usr/bin/env bash

update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
echo User `whoami` is provisioning

function install {
    echo installing $1
    shift
    apt-get -y install "$@"
}

echo Adding elasticsearch repo
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
add-apt-repository -y "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"

echo Upgrading packages
apt-get -y update >/dev/null 2>&1
apt-get -y upgrade >/dev/null 2>&1

install JDK default-jdk

install 'development tools' build-essential
install ElasticSearch elasticsearch

echo Setting ElasticSearch to boot on startup
update-rc.d elasticsearch defaults 95 10
/etc/init.d/elasticsearch start

install Git git
install memcached memcached

locale-gen sv_SE.UTF-8
install PostgreSQL postgresql postgresql-client postgresql-contrib libpq-dev

/etc/init.d/postgresql stop

# Remove default postgres db and create new with sv_SE.UTF-8
rm -rf /var/lib/postgresql/9.3/main
sudo -u postgres /usr/lib/postgresql/9.3/bin/initdb -D /var/lib/postgresql/9.3/main --encoding=UTF8 --lc-collate=sv_SE.UTF-8 --lc-ctype=sv_SE.UTF-8

sudo -u postgres /etc/init.d/postgresql start
sudo -u postgres createuser --superuser vagrant
sudo -u postgres createdb -O vagrant sitesearch_development --encoding=UTF8 --locale=sv_SE.UTF-8
sudo -u postgres createdb -O vagrant sitesearch_test --encoding=UTF8 --locale=sv_SE.UTF-8

install nodejs nodejs
install npm npm
# npm install -g bower
# npm install -g grunt --save-dev
# npm install -g grunt-cli --save-dev
# npm install grunt-grunticon --save-dev
