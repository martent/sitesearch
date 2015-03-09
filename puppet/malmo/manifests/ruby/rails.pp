class malmo::ruby::rails {

  file { "database":
    path    => "${::app_home}/config/database.yml",
    # owner   => 'root',
    # group   => 'root',
    # mode    => '0755',
    content => template('malmo/rails/database.erb'),
  }

  file { "secrets":
    path    => "${::app_home}/config/database.yml",
    # owner   => 'root',
    # group   => 'root',
    # mode    => '0755',
    content => template('malmo/rails/database.erb'),
  }

  # file { "app":
  #   path    => "${::app_home}/config/app_config.yml",
  #   # owner   => 'root',
  #   # group   => 'root',
  #   # mode    => '0755',
  #   content => template('malmo/rails/app_config.erb'),
  # }
}
