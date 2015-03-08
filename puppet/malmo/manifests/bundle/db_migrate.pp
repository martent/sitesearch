class malmo::bundle::db_migrate {
  require ::malmo::rbenv
  require ::malmo::mysql

  exec { 'migrate database':
    command => 'bundle exec rake db:migrate',
    user    => $::runner[name],
    path    => $::runner[path],
    cwd     => $::app[home],
  }

  exec { 'migrate test database':
    command => 'bundle exec rake db:migrate RAILS_ENV=test',
    user    => $::runner[name],
    path    => $::runner[path],
    cwd     => $::app[home],
    onlyif  => $::db[create_test]
  }
}
