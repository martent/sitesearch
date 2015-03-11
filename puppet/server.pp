# cd /app_runner
# sudo puppet apply puppet/app_runner.pp

$runner_name  = 'app_runner'
$runner_group = 'app_runner'
$runner_home  = '/home/app_runner'
$runner_path  = "${::runner_home}/.rbenv/shims:${::runner_home}/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin"

$app_name = 'sitesearch'
$app_home = "${::runner_home}/${::app_name}/current"

class { '::mcommons': }

class { '::mcommons::mysql':
}

class { '::mcommons::elasticsearch':
  version => '1.4',
  memory  => '1g',
}

class { '::mcommons::memcached':
  memory => 512,
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
mcommons::ruby::db_migrate { 'production': }
