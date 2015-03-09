class malmo::elasticsearch {
  class { '::elasticsearch':
    manage_repo  => true,
    repo_version => $::elasticsearch[version],
    java_install => true,
    config       => {
      'network.host' => '127.0.0.1',
    },
  }

  ::elasticsearch::instance { 'es-01': }

  ::logrotate::rule { 'elasticsearch':
    path         => '/var/log/elasticsearch/es-01',
    rotate       => 52,
    rotate_every => 'week',
  }
}
