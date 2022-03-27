#!/bin/bash

# Clean package cache etc.
yay -Sc

# Cleanup the home directory
rm ~/.bash_history ~/.node_repl_history
rm -rf ~/.local/share/Trash/*
