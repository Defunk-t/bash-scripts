#!/bin/sh

# Mount NAS over SSH
sshfs -C -o follow_symlinks,allow_root server:/mnt/nas/main /mnt/nas
