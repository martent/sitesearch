class malmo::unicorn {
  # Parse and copy init.d script
  file { "unicorn-init":
    path    => "/etc/init.d/${::app[name]}",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('malmo/unicorn.erb'),
  }
}
