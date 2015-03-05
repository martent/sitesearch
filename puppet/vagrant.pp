# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/vagrant.pp

$runner = {
  name  => 'vagrant',
  group => 'vagrant',
  home  => '/home/vagrant',
}

$runners_path = "${::runner[home]}/.rbenv/shims:${::runner[home]}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_dir = '/vagrant'

$db = {
  name            => 'sitesearch',
  user            => 'vagrant',
  password        => '',
  root_password   => '',
  backup_password => '',
  backup_time     => ['3', '45'],
  backup_dir      => "${::runner[home]}/backups",
  create_test     => "true"
}

$elasticsearch = {
  version => '1.4', # major.minor
  size    => '96',
}

$memcached_size = '24'

$ruby_version    = '2.2.1'

include malmo::system
include malmo::rbenv
include malmo::mysql
include malmo::mysql::backup
include malmo::elasticsearch
include malmo::memcached
include malmo::bundle::install
include malmo::bundle::db_migrate
include malmo::bundle::rspec_deps
include malmo::post_install
