class malmo::nginx {
  apt::ppa { 'ppa:nginx/stable': }

  exec { 'nginx-install':
    command => '/usr/bin/apt-get install -qq nginx',
    require => Class['::malmo::system']
  }
}
