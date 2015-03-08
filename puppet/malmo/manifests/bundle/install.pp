class malmo::bundle::install {
  require ::malmo::rbenv

  exec { 'bundle install':
    command => 'bundle install',
    user    => $::runner[name],
    path    => $::runner[path],
    cwd     => $::app[home],
    timeout => 1000,
  }
}
