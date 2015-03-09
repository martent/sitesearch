class malmo::ruby::rails {

  file { "database":
    path    => "${::app_home}/config/database.yml",
    # owner   => 'root',
    # group   => 'root',
    # mode    => '0755',
    content => template('malmo/rails_database.yml.erb'),
  }

  file { "secrets":
    path    => "${::app_home}/config/secrets.yml",
    # owner   => 'root',
    # group   => 'root',
    # mode    => '0755',
    content => template('malmo/rails_secrets.yml.erb'),
  }

  # file { "app":
  #   path    => "${::app_home}/config/app_config.yml",
  #   # owner   => 'root',
  #   # group   => 'root',
  #   # mode    => '0755',
  #   content => template('malmo/rails/app_config.erb'),
  # }
}
