#!/bin/sh

FULL_DATE=$(date '+%F')

GPG_USER=aidan

# Validate parameter is a directory
if [[ -d $1 ]]; then
  doas echo "Backing up wallets ..."
else
  echo "$1 is not a valid directory"
  exit 1
fi

# Create tar and pipe it through GPG
# Full backup is made once a month
# Incremental backups are made throughout the month
doas tar -czvf - \
    /home/btc-wallet/.electrum/wallets \
    /home/xmr/Monero/wallets \
| gpg -se -r $GPG_USER \
      -z 0 --cipher-algo aes256 \
      -o "$1"/"$FULL_DATE".tgz.gpg

# TODO: check output file exists, ask to overwrite or abort
