$runner_name  = 'app-runner'
$runner_group = 'users'
$runner_home  = '/home/app-runner'
$runner_path  = "${::runner_home}/.rbenv/shims:${::runner_home}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_name = 'sitesearch'
$app_home = "${::runner_home}/${::app_name}/current"

$elasticsearch = {
  version => '1.4', # major.minor
  size    => '1g',  # unit as m or g
}
$ruby_version    = '2.2.1'

class { '::mcommons': } ->
class { '::mcommons::mysql':
  db_name          => $::app_name,
  db_user          => $::app_user,
  db_password      => inline_template('<%= SecureRandom.hex(rand(12..24)) -%>'),
  db_root_password => inline_template('<%= SecureRandom.hex(rand(12..24)) -%>'),
  create_test_db   => false,
  daily_backup     => true,
  backup_password  => inline_template('<%= SecureRandom.hex(rand(12..24)) -%>'),
  backup_time      => ['3', '45'],,
  backup_dir       => "${::app_home}/db_backups",
}

# ::mcommons::elasticsearch { 'Setting up ElasticSearch': }
class { '::mcommons::memcached':
  memory => 128,
}
# ::mcommons::nginx { 'Setting up nginx': }
# ::mcommons::ruby { 'Setting up rbenv and Ruby': } ->
# ::mcommons::ruby::unicorn { 'Setting up Unicorn': } ->
# ::mcommons::ruby::gems { 'Bundle installing gems': } ->
# ::mcommons::ruby::db_migrate { 'Migrating database': } ->
# ::mcommons::ruby::rails { 'Configuring Rails environment': } ->
# ::mcommons::ruby::rspec_deps { 'Installing RSpec dependencies': }
