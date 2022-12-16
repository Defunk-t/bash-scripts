# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export SCRIPT_DIR=~/scripts/

REPOS_DIR=~/repos/

export PATH=$PATH:$SCRIPT_DIR/:$REPOS_DIR/password-manager-cli/

PS1='[\u@\h \W]\$ '
GITHUB=git@github.com:aidlran

umask 007

alias ls='ls --color=auto'

# Edit GPG files
alias gpgedit='gpg_edit.sh --gpg-args "-ser aidan"'

# CLI Password Manager
# See: https://github.com/aidlran/cli-password-manager
alias pw-mod='pw-mod --gpg-args "-ser aidan"'

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
