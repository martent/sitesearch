class malmo::mysql::backup {
  class { '::mysql::server::backup':
    backupdatabases => $::db[name],
    backupuser      => $::db[user],
    backuppassword  => $::db[password],
    backupdir       => $::db[backup_dir],
    time            => $::db[backup_time],
    backuprotate    => '60',
    backupcompress  => true,
  }
}
