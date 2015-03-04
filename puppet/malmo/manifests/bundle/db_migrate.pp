class malmo::bundle::db_migrate {
  exec { 'migrate database':
    command => 'bundle exec rake db:migrate',
    user    => $::runner[name],
    path    => $::runners_path,
    cwd     => $::app_dir,
    require => Class['::malmo::mysql']
  }
}
