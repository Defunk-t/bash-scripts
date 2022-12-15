#!/bin/sh

YEAR=$(date '+%Y')
MONTH=$(date '+%m')
FULL_DATE=$(date '+%F')

GPG_USER=aidlo.dev@pm.me
SNAR="$1"/"$YEAR"-"$MONTH".snar

# Validate parameter is a directory
if [[ -d $1 ]]; then
  sudo echo "Backing up /home ..."
else
  echo "$1 is not a valid directory"
  exit 1
fi

# Decrypt snapshot data
if [ -f "$SNAR".gpg ]; then
  gpg -d "$SNAR".gpg > "$SNAR"
fi

# Create tar and pipe it through GPG
# Full backup is made once a month
# Incremental backups are made throughout the month
sudo tar -czvf - \
      -X ~/backup_exclude.txt \
      -T ~/backup_include.txt \
      -g "$SNAR" \
| gpg -se -r $GPG_USER \
      --cipher-algo aes256 \
      -o "$1/$FULL_DATE.tgz.gpg"

# Encrypt snapshot data
gpg -se -r $GPG_USER \
    --cipher-algo aes256 \
    -o "$SNAR.gpg" \
       "$SNAR" \
&& rm "$SNAR"
