#!/bin/bash

NAS_MOUNTPOINT=/mnt/nas
BACKUP_DIR=$NAS_MOUNTPOINT/backup
SCRIPT_DIR=~/scripts

# Mount NAS filesystem if not mounted
if ! mountpoint -q $NAS_MOUNTPOINT; then
  $SCRIPT_DIR/mount_nas.sh
fi

# Run backup scripts
$SCRIPT_DIR/backup_laptop.sh $BACKUP_DIR/laptop/
$SCRIPT_DIR/backup_wallets.sh $BACKUP_DIR/wallets/
