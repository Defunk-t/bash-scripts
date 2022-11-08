# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim

PS1='[\u@\h \W]\$ '
SCRIPT_DIR=~/scripts/

umask 007

alias ls='ls --color=auto'
alias pw-get=$SCRIPT_DIR/pw_get.sh
