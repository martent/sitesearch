class malmo::mysql::backup {
  class { '::mysql::server::backup':
    ensure          => present,
    backupdatabases => [$::db[name]],
    backupuser      => 'backup_runner',
    backuppassword  => $::db[backup_password],
    backupdir       => $::db[backup_dir],
    time            => $::db[backup_time],
    backuprotate    => '60',
    backupcompress  => true,
  }
}
