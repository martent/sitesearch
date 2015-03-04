class malmo::mysql::backup {
  class { '::mysql::server::backup':
    backupdatabases => $db[name],
    backupuser      => 'backup_runner',
    backuppassword  => template('malmo/pw_generator.erb'),
    backupdir       => $db[backup_dir],
    time            => $db[backup_time],
    backuprotate    => '60',
    backupcompress  => true,
  }
}
