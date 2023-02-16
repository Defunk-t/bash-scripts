#!/bin/sh

# Recursively set permissions for a directory

read -r -p "Folder to work on: " folder
read -r -p "Set owner to: " owner
read -r -p "Set group to: " group
read -r -p "Set folder permissions to: " dperm
read -r -p "Set file permissions to: " fperm

doas chown -R "$owner":"$group" "$folder"
doas find "$folder" -type d -exec chmod "$dperm" {} \;
doas find "$folder" -type f -exec chmod "$fperm" {} \;
