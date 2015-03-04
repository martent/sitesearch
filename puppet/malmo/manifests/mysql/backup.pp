class malmo::mysql::backup {
  $pw = template('malmo/pw_generator.erb')

  class { '::mysql::server::backup':
    backupdatabases => $::db[name],
    backupuser      => 'backup_runner',
    backuppassword  => $pw,
    backupdir       => $::db[backup_dir],
    time            => $::db[backup_time],
    backuprotate    => '60',
    backupcompress  => true,
  }

  ::malmo::info { 'message':
    message => "MySQL password for user backup_runner: ${pw}"
  }
}
