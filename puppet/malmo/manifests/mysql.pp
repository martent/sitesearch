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

  ::malmo::mysql::db { 'main_db':
    db_name => $::db[name]
  }

  if $::db[create_test]
    ::malmo::mysql::db { 'test_db':
      db_name => "${::db[name]}_test"
    }
  }
}
