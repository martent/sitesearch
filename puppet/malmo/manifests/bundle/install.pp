class malmo::bundle::install {
  require ::malmo::rbenv

  exec { 'bundle install':
    command => 'bundle install',
    user    => $::runner[name],
    path    => $::runners_path,
    cwd     => $::app_dir,
    timeout => 1000,
  }
}
