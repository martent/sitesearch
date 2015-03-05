class malmo::bundle::db_migrate {
  require ::malmo::rbenv
  require ::malmo::mysql

  exec { 'migrate database':
    command => 'bundle exec rake db:migrate',
    user    => $::runner[name],
    path    => $::runners_path,
    cwd     => $::app_dir,
  }
}
