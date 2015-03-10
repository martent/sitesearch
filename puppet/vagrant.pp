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

::mcommons::mysql { 'Setting up MySQL': }
::mcommons::elasticsearch { 'Setting up ElasticSearch': }
::mcommons::memcached { 'Setting up memcached': }
::mcommons::nginx { 'Setting up nginx': }
::mcommons::ruby { 'Setting up rbenv and Ruby': } ->
::mcommons::ruby::unicorn { 'Setting up Unicorn': } ->
::mcommons::ruby::gems { 'Bundle installing gems': } ->
::mcommons::ruby::db_migrate { 'Migrating database': } ->
::mcommons::ruby::rails { 'Configuring Rails environment': } ->
::mcommons::ruby::rspec_deps { 'Installing RSpec dependencies': }
