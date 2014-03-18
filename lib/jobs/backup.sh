#!/bin/bash

SAVEDIR=/var/www/dump

if [ ! -d $SAVEDIR ]; then
  mkdir -p $SAVEDIR
fi

pg_dump sitesearch | bzip2 > $SAVEDIR/sitesearch-`date +%Y-%m-%d_%H%M`.sql.bz2

# Cleanup old backups
find $SAVEDIR -daystart -mtime +30 -exec rm {} \;
