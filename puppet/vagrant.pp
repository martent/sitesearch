# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/vagrant.pp

$::runner = {
  name  => 'vagrant',
  group => 'vagrant'
}

$::app_dir = '/vagrant'

$::db = {
  name        => 'sitesearch',
  user        => 'vagrant',
  password    => ''
  backup_time => ['3', '45'],
  backup_dir  => "/home/${::runner['name']}/backups",
}

$::elasticsearch = {
  version => '1.4', # major.minor
  size    => '96',
}

$::memcached_size = '512'

$::ruby_version    = '2.2.1'

include malmo::system
include malmo::rbenv
include malmo::mysql
include malmo::elastic
include malmo::memcached
