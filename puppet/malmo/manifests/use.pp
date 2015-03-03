class malmo::use {
  file {'testfile':
    path    => '/vagrant/testfile',
    content => "The dog $roo $fox",
  }
}
