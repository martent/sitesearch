$runner_name  = 'vagrant'
$runner_group = 'vagrant'
$runner_home  = '/home/vagrant'
$runner_path  = "${::runner_home}/.rbenv/shims:${::runner_home}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_name       = 'sitesearch'
$app_home       = '/vagrant'
$app_config_dir = '/vagrant/config'

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

class { 'mcommons::ruby::unicorn': }
class { 'mcommons::ruby::bundle_install': }
class { 'mcommons::ruby::rails': }
class { 'mcommons::ruby::rspec_deps': }
mcommons::ruby::db_migrate { ['development', 'test']: }
