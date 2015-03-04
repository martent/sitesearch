define malmo::info ($message) {
  file {'log_file':
    ensure  => present,
    path    => "${::runner['home']}/puppet_post_install_info.txt",
    mode    => '0600',
    replace => false
    content => "${message}\n",
  }
}
