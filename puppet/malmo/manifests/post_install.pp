class malmo::post_install {

  file { "${::runner_home}/puppet_post_install_info.txt":
    mode    => '0600',
    content => "
Database created: '${::db[name]}'
Password for DB user root: '${::db[root_password]}'
Password for DB user ${::db[user]}: '${::db[password]}'
Password for DB user backup_runner (if such user): '${::db[backup_password]}'
",
  }
}
