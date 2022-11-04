#!/bin/bash

FULL_DATE=$(date '+%F')

# Validate parameter is a directory
if [[ -d $1 ]]; then
  echo "Backing up wallets ..."
else
  echo "$1 is not a valid directory"
  exit 1
fi

# Create tar and pipe it through GPG
# Full backup is made once a month
# Incremental backups are made throughout the month
sudo tar -czvf - /home/btc-wallet/.electrum/wallets \
| gpg -c -z 0 --cipher-algo aes256 \
      -o "$1"/"$FULL_DATE".tgz.gpg
