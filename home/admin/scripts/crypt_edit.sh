#!/bin/bash

# last arg is the file to edit
FILE="${!#}"

# Defaults
BACKUP=0
BACKUP_FILE=$FILE.tmp

# A file must be provided
if [ "$#" -eq 0 ]; then
  echo "No argument given."
  exit 1
elif [ ! -f $FILE ]; then
  echo "File doesn't exist: '$FILE'"
  exit 1
fi

# Iterate through arguments
while [[ $# -gt 0 ]]; do

  # Validate --backup argument, exit on fail
  if [[ "$1" == "--backup" ]]; then

    # Check it is followed up by at least two args
    if [[ -z "${2:-}" || -z "${3:-}" ]]; then
      echo "Usage (with --backup): cedit --backup <backup_file> <file_to_edit>"
      exit 1

    elif [[ "$2" == "$FILE" ]]; then
      echo "Backup file cannot be the same as the file to edit."
      exit 1
    fi

    # Validated, setup --backup argument
    BACKUP=1
    BACKUP_FILE="$2"
    shift
  fi
  shift
done

# Always move the file to prevent issues
# with GPG asking to confirm overwrite
mv $FILE $BACKUP_FILE

# Decrypt, edit in editor, re-encrypt
gpg -do - $BACKUP_FILE \
| $SCRIPT_DIR/editor_pipe_in_out.sh \
| gpg -ser aidan --cipher-algo aes256 -o $FILE -

# Delete old version when we're done
# with it unless user wanted a backup
if [ ! $BACKUP ]; then
  rm $BACKUP_FILE
fi
