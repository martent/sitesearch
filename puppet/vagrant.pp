# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/vagrant.pp

$runner = {
  name  => 'vagrant',
  group => 'vagrant',
  home  => '/home/vagrant',
  path  => '/home/vagrant/.rbenv/shims:/home/vagrant/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin',
}

$app = {
  name => 'sitesearch',
  home => '/vagrant',
}

$db = {
  name            => $::app[name],
  user            => 'vagrant',
  password        => '',
  root_password   => '',
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
include malmo::elasticsearch
include malmo::memcached
include malmo::nginx
include malmo::bundle::install
include malmo::bundle::db_migrate
include malmo::bundle::rspec_deps
include malmo::post_install
