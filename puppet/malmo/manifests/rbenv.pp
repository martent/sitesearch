class malmo::rbenv {
  class { '::rbenv':
    install_dir => "/home/${::runner[name]}/.rbenv",
    owner       => $runner[name],
    group       => $runner[group],
  }
  ::rbenv::plugin { 'sstephenson/ruby-build': }
  ::rbenv::build { $ruby_version: global => true }
}
