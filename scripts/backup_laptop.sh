#!/bin/bash

# TODO: encrypt .snar file

YEAR=$(date '+%Y')
MONTH=$(date '+%m')
FULL_DATE=$(date '+%F')

# Validate parameter is a directory
if [[ -d $1 ]]; then
  sudo echo "Backing up /home ..."
else
  echo "$1 is not a valid directory"
  exit 1
fi

# Create tar and pipe it through GPG
# Full backup is made once a month
# Incremental backups are made throughout the month
sudo tar -czvf - \
      -X ~/backup_exclude.txt \
      -g "$1"/"$YEAR"-"$MONTH"-metadata.snar \
      /home \
| gpg -se -r "aidlo.dev@pm.me" \
      -z 0 --cipher-algo aes256 \
      -o "$1"/"$FULL_DATE".tgz.gpg
