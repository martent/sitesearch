class malmo::mysql {
  package { 'libmysqlclient-dev':}

  class { '::mysql::bindings':
    ruby_enable => true
  }

  class { '::mysql::server':
    root_password   => $::db[root_password],
    # remove_default_accounts => true,
    service_enabled => true,
    service_manage  => true,
  }

  ::mysql::db { $::db[name]:
    ensure   => present,
    user     => $::db[user],
    password => $::db[password],
    host     => 'localhost',
    grant    => ['ALL'],
    charset  => 'utf8',
    collate  => 'utf8_swedish_ci',
  }
}
