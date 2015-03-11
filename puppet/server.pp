$runner_name  = 'app-runner'
$runner_group = 'users'
$runner_home  = '/home/app-runner'
$runner_path  = "${::runner_home}/.rbenv/shims:${::runner_home}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_name = 'sitesearch'
$app_home = "${::runner_home}/${::app_name}/current"

$db = {
  name            => $::app_name,
  user            => $::app_user,
  password        => template('mcommons/pw_generator.erb'),
  root_password   => template('mcommons/pw_generator.erb'),
  daily_backup    => true,
  backup_password => template('mcommons/pw_generator.erb'),
  backup_time     => ['3', '45'],
  backup_dir      => '/var/www/db_backups',
}

$elasticsearch = {
  version => '1.4', # major.minor
  size    => '1g',  # unit as m or g
}
$memcached_size = '512'
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
