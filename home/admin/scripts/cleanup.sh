#!/bin/sh

# Clean the package manager
#  Uninstall orphans
doas aura -Oj
#  Clean cache etc.
doas aura -Sc

# Clean Docker
doas docker system prune -f

# Clean the home directory
rm ~/.*_history
rm -rf ~/.local/share/Trash/*
