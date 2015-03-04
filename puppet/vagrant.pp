# puppet parser validate puppet/vagrant.pp

# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/vagrant.pp

$runner = {
  name  => 'vagrant',
  group => 'vagrant',
  home  => '/home/vagrant'
}

$app_dir = '/vagrant'

$db = {
  name        => 'sitesearch',
  user        => 'vagrant',
  password    => '',
  backup_time => ['3', '45'],
  backup_dir  => "${::runner[home]}/backups",
}

$elasticsearch = {
  version => '1.4', # major.minor
  size    => '96',
}

$memcached_size = '512'

$ruby_version    = '2.2.1'

include malmo::system
include malmo::rbenv
include malmo::mysql
include malmo::elasticsearch
include malmo::memcached

# # exec { 'migrate_database':
# #   command => 'bundle exec rake db:migrate',
# #   user    => $runner[name]
# #   path    => "${::runner[home]}.rbenv/shims:${::runner[home]}.rbenv/bin:"
# #   cwd     => $app_dir
# # }
# #
# # exec { 'migrate_database':
# #   command => 'bundle exec rake environment elasticsearch:reindex CLASS='Recommendation' ALIAS='recommendations' RAILS_ENV=development',
# #   user    => $runner[name],
# #   path    => "${::runner[home]}.rbenv/shims:${::runner[home]}.rbenv/bin:",
# #   cwd     => $app_dir,
# # }
# #
# # exec { 'run_specs':
# #   command => 'bundle bundle exec rspec',
# #   user    => $runner[name],
# #   path    => "${::runner[home]}.rbenv/shims:${::runner[home]}.rbenv/bin:",
# #   cwd     => $app_dir,
# # }
