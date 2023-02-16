#!/bin/sh

YEAR=$(date '+%Y')
MONTH=$(date '+%m')
FULL_DATE=$(date '+%F')

# SNAR="$1"/"$YEAR"-"$MONTH".snar

GPG_USER=aidan

# Validate parameter is a directory
if [[ -d $1 ]]; then
  doas echo "Backing up /home ..."
else
  echo "$1 is not a valid directory"
  exit 1
fi

# Create tar and pipe through GPG
# Incremental backups are currently disabled
#     -g "$SNAR" \
doas tar -czvf - \
      -X ~/backup_exclude.txt \
      -T ~/backup_include.txt \
| gpg -ser $GPG_USER \
      --cipher-algo aes256 \
      -o "$1/$FULL_DATE.tgz.gpg"

# TODO: check output file exists, ask to overwrite or abort
