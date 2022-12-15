#!/bin/sh

ACTIVE_FILE=~/documents/pw.gpg
BACKUP_FILE=~/documents/pw.old/$(date -r $ACTIVE_FILE '+%Y%m%d%H%M%S').gpg

# Make sure file is backed up
mv $ACTIVE_FILE $BACKUP_FILE

# Decrypt, edit in editor, re-encrypt
gpg -d $BACKUP_FILE \
| $SCRIPT_DIR/editor_pipe_in_out.sh \
| gpg -o $ACTIVE_FILE\
    -ser aidan \
    --cipher-algo aes256 \
    -
