class malmo::bundle::install {
  exec { 'bundle install':
    command => 'bundle install',
    user    => $::runner[name],
    path    => $::runners_path,
    cwd     => $::app_dir,
    require => Class['::malmo::rbenv']
  }
}
