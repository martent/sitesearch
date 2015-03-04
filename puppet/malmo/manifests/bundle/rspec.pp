class malmo::bundle::rspec {

  package { 'phantomjs':}

  exec { 'run_specs':
    command => 'bundle exec rspec',
    user    => $::runner[name],
    path    => $::runners_path,
    cwd     => $::app_dir,
    require => Class['::malmo::bundle::migrate_database']
  }
}
