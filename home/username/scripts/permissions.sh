#!/bin/bash
# Recursively set permissions for a directory

read -p "Folder to work on: " folder
read -p "Set owner to: " owner
read -p "Set group to: " group
read -p "Set folder permissions to: " dperm
read -p "Set file permissions to: " fperm

sudo chown -R "$owner":"$group" "$folder"
sudo find "$folder" -type d -exec chmod "$dperm" {} \;
sudo find "$folder" -type f -exec chmod "$fperm" {} \;
