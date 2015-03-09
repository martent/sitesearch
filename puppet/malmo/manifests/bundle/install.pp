class malmo::bundle::install {
  require ::malmo::rbenv

  exec { 'bundle install':
    command => 'bundle install',
    user    => $::runner_name,
    path    => $::runner_path,
    cwd     => $::app_home,
    timeout => 1000,
  }
}
