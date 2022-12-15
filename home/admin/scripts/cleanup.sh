#!/bin/sh

# Clean the package manager
#  Uninstall orphans
sudo aura -Oj
#  Clean cache etc.
sudo aura -Sc

# Clean the home directory
rm ~/.*_history
rm -rf ~/.local/share/Trash/*
