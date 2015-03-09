# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/server.pp

$runner = {
  name  => 'app-runner',
  group => 'users',
  home  => '/home/app-runner',
  path  => '/home/app-runner/.rbenv/shims:/home/app-runner/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin',
}

$app[name] = 'sitesearch'
$app[home] = "${::runner[home]}/${::app[name]}/current"

$db = {
  name            => $::app[name],
  user            => $::app[name],
  password        => template('malmo/pw_generator.erb'),
  root_password   => template('malmo/pw_generator.erb'),
  daily_backup    => "true",
  backup_password => template('malmo/pw_generator.erb'),
  backup_time     => ['3', '45'],
  backup_dir      => "${::runner['home']}/backups",
}

$elasticsearch = {
  version => '1.4', # major.minor
  size    => '1024',
}
$memcached_size = '512'
$ruby_version    = '2.2.1'

include malmo::system
include malmo::rbenv
include malmo::mysql
include malmo::elasticsearch
include malmo::memcached
include malmo::nginx
include malmo::unicorn
include malmo::bundle::install
include malmo::bundle::db_migrate
include malmo::post_install
