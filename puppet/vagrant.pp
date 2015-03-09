# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/vagrant.pp

$runner_name  = 'vagrant'
$runner_group = 'vagrant'
$runner_home  = '/home/vagrant'
$runner_path  = "${::runner_home}/.rbenv/shims:${::runner_home}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_name = 'sitesearch'
$app_home = '/vagrant'

$install_info = "${::runner_home}/install_info.txt"

$db = {
  name            => $::app_name,
  user            => $::app_user,
  password        => '',
  root_password   => '',
  create_test     => true,
}

$elasticsearch = {
  version   => '1.4', # major.minor
  size      => '96m',
}
$memcached_size = '24'
$ruby_version    = '2.2.1'

include malmo::system
include malmo::mysql
include malmo::elasticsearch
include malmo::memcached
include malmo::nginx
include malmo::ruby
include malmo::ruby::unicorn
include malmo::ruby::gems
include malmo::ruby::db_migrate
include malmo::ruby::rails
include malmo::ruby::rspec_deps
