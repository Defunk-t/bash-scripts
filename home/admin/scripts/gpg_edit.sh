#!/bin/bash

# Edits a GPG encrypted file in the default
# editor optionally making a backup.

# Modified version of pw-mod.sh from my cli-password-manager repo.
#   - https://github.com/aidlran/cli-password-manager

# last arg is the file to edit
FILE="${!#}"

# Defaults
BACKUP=0
BACKUP_FILE="$FILE.tmp"
GPG_ARGS="-c"

usage() {
  echo "Usage: gpgedit [...args] <file_to_edit>"
  echo "  --backup <backup_file>  Keep a backup of the file."
  echo "  --gpg-args <gpg_args>   Pass custom arguments to GPG. Default: \"-c\"."
  echo "  --help                  Show this help message."
}

# A file must be provided
if [ "$#" -eq 0 ]; then
  usage
  exit 1
fi

# Process args
while [[ $# -gt 0 ]]; do

  # Help
  if [[ "$1" == "--help" ]]; then
    usage
    exit 0
  fi

  # Validate --backup argument, exit on fail
  if [[ "$1" == "--backup" ]]; then

    # Check it is followed up by at least two args
    if [[ -z "${2:-}" || -z "${3:-}" ]]; then
      usage
      exit 1

    elif [[ "$2" == "$FILE" ]]; then
      echo "Backup file cannot be the same as the file to edit."
      exit 1

    else
      BACKUP=1
      BACKUP_FILE="$2"
      shift
    fi
  fi

  if [[ "$1" == "--gpg-args" ]]; then
    if [[ -z "${2:-}" ]]; then
      usage
      exit 1
    else
      GPG_ARGS="$2"
      shift
    fi
  fi

  shift

done

if [ ! -f $FILE ]; then
  BACKUP=0
  echo | gpg $GPG_ARGS -o $FILE -
fi

# Always move the file to prevent issues
# with GPG asking to confirm overwrite
mv $FILE $BACKUP_FILE

# Pipe into and out of EDITOR
editor_pipe() {
  TMPFILE=`mktemp /tmp/pw.XXXXXXXX`
  cat > $TMPFILE
  $EDITOR $TMPFILE < /dev/tty > /dev/tty
  cat $TMPFILE
  rm $TMPFILE
}

# Decrypt, edit in editor, re-encrypt
gpg -do - $BACKUP_FILE \
| editor_pipe \
| gpg $GPG_ARGS -o $FILE -

# Delete old version when we're done
# with it unless user wanted a backup
if [ $BACKUP -eq 0 ]; then
  rm $BACKUP_FILE
fi
