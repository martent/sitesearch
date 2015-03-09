# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/vagrant.pp

$runner_name  = 'vagrant'
$runner_group = 'vagrant'
$runner_home  = '/home/vagrant'
$runner_path  = '${::runner[home]}/.rbenv/shims:${::runner[home]}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin'

$app_name = 'sitesearch'
$app_home = '/vagrant'

$db = {
  name            => $::app_name,
  user            => $::app_user,
  password        => '',
  root_password   => '',
  create_test     => 'true',
}

$elasticsearch = {
  version => '1.4', # major.minor
  size    => '96',
}
$memcached_size = '24'
$ruby_version    = '2.2.1'

# include malmo::system
# include malmo::rbenv
# include malmo::mysql
# include malmo::elasticsearch
# include malmo::memcached
# include malmo::nginx
include malmo::unicorn
# include malmo::bundle::install
# include malmo::bundle::db_migrate
# include malmo::bundle::rspec_deps
# include malmo::post_install
