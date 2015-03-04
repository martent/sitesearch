class malmo::system {
  class { '::locales':
    default_value => 'en_US.UTF-8',
    available     => ['en_US.UTF-8 UTF-8', 'sv_SE.UTF-8 UTF-8']
  }

  exec { 'apt-get-update':
    command => '/usr/bin/apt-get update'
  }

  include git

  package {[
      'autoconf', 'bison', 'build-essential', 'libssl-dev',
      'libgdbm3', 'libgdbm-dev',
      'htop',
    ]:
    ensure  => installed,
    require => Exec['apt-get-update'],
  }

  class { '::ntp':
    servers  => ['ntp.malmo.se'],
    restrict => ['127.0.0.1'],
  }
}
