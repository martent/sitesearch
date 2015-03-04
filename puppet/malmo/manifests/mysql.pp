class malmo::mysql {
  class { '::mysql::server':
    root_password   => $::db[root_password],
    # remove_default_accounts => true,
    service_enabled => true,
    service_manage  => true,
  }

  ::mysql::db { $::db[name]:
    user     => $::db[user],
    password => $::db[password],
    host     => 'localhost',
    grant    => ['ALL'],
    charset  => 'utf8',
    collate  => 'utf8_swedish_ci',
  }
}
