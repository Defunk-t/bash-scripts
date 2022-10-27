#!/bin/bash

YEAR=$(date '+%Y')
MONTH=$(date '+%m')
FULL_DATE=$(date '+%F')

NAS_MOUNTPOINT=/mnt/nas
BACKUP_DIR=$NAS_MOUNTPOINT/backup/laptop
SCRIPT_DIR=~/scripts

# Mount NAS filesystem if not mounted
if ! mountpoint -q $NAS_MOUNTPOINT; then
  $SCRIPT_DIR/mount_nas.sh
fi

# Do a sudo command now as issues seem to arise if sudo
# and SSH both want a password entered in rapid succession
sudo echo

# Create tar and pipe it through GPG
# Full backup is made once a month
# Incremental backups are made throughout the month
sudo tar -czvf - -X ~/.backup_exclude -g $BACKUP_DIR/"$YEAR"-"$MONTH"_metadata.snar /home | gpg -c --cipher-algo aes256 -o $BACKUP_DIR/"$FULL_DATE".tar.gz.gpg
