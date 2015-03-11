# cd /vagrant
# sudo puppet apply puppet/vagrant.pp

$runner_name  = 'vagrant'
$runner_group = 'vagrant'
$runner_home  = '/home/vagrant'
$runner_path  = "${::runner_home}/.rbenv/shims:${::runner_home}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_name = 'sitesearch'
$app_home = '/vagrant'

class { '::mcommons': }

class { '::mcommons::mysql':
  db_password      => '',
  db_root_password => '',
  create_test_db   => true,
  daily_backup     => false,
}

class { '::mcommons::elasticsearch':
  version => '1.4',
  memory  => '48m',
}

class { '::mcommons::memcached':
  memory => 128,
}

# class { '::mcommons::apache':
#  modules => ['php']
# }

class { '::mcommons::nginx': }

class { '::mcommons::ruby':
  version => '2.2.1',
}
# ::mcommons::ruby::unicorn { 'Setting up Unicorn': } ->
# ::mcommons::ruby::gems { 'Bundle installing gems': } ->
# ::mcommons::ruby::db_migrate { 'Migrating database': } ->
# ::mcommons::ruby::rails { 'Configuring Rails environment': } ->
# ::mcommons::ruby::rspec_deps { 'Installing RSpec dependencies': }
