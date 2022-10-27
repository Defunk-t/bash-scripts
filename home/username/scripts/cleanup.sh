#!/bin/bash

# Clean the package manager
#  Uninstall orphans
sudo aura -Oj
#  Clean cache etc.
sudo aura -Sc

# Clean the home directory
rm ~/.bash_history ~/.node_repl_history
rm -rf ~/.local/share/Trash/*
