class malmo::rbenv {
  package {[
      'libgdbm3', 'libgdbm-dev',
    ]:
    ensure  => installed,
  }

  class { '::rbenv':
    install_dir => "${::runner[home]}/.rbenv",
    owner       => $::runner[name],
    group       => $::runner[group],
    require     => Class['::malmo::system']
  }
  ::rbenv::plugin { 'sstephenson/ruby-build': }
  ::rbenv::build { $::ruby_version: global => true }
}
