# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export SCRIPT_DIR=~/scripts/

PS1='[\u@\h \W]\$ '
GITHUB=git@github.com:aidlran

umask 007

alias ls='ls --color=auto'
alias cedit=$SCRIPT_DIR/crypt_edit.sh
alias pw-get=$SCRIPT_DIR/pw_get.sh
alias pw-mod=$'$SCRIPT_DIR/crypt_edit.sh --backup ~/documents/pw.old/$(date -r ~/documents/pw.gpg \'+%Y%m%d%H%M%S\').gpg ~/documents/pw.gpg'
alias doas='sudo -u'

# "NPM Safe"
# Execute NPM commands as dev-node user
alias npms='sudo -u dev-node npm' 

# Sneaky function that commits with a specific date
git-commit-date() {
  GIT_COMMITTER_DATE="$1" git commit --date "$1" "${@:2}"
}

# Sneaky function that amends a commit with the same date
git-commit-amend() {
  GIT_COMMITTER_DATE="$(git log -1 --format=%cd)" git commit --amend --date "$(git log -1 --format=%cd)" "$@"
}
