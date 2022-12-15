#!/bin/sh

# Script is ran manually after cd-ing into mounted
# dir where .SeedVaultAndroidBackup/ can be found

# Create tar and pipe it through GPG
tar -czvf - .SeedVaultAndroidBackup/ | gpg \
  -se -r "aidlo.dev@pm.me" \
  -z 0 --cipher-algo aes256 \
  -o /mnt/nas/backup/android/$(date '+%F').tgz.gpg
