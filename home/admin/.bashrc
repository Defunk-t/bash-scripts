# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment variables - available to other programs & scripts
export EDITOR=vim
export TERM=alacritty
export SCRIPT_DIR=~/Scripts

# Bash variables - available in this Bash session
PROJECT_DIR=~/Projects

# Append PATH
export PATH=$PATH:$SCRIPT_DIR:$PROJECT_DIR/cli-password-manager

# Permissions mask for new files
umask 007

# Edit GPG files
alias gpg-edit='gpg-edit --gpg-args "-esr aidan@loughran.dev"'

# CLI Password Manager
# See: https://github.com/aidlran/cli-password-manager
alias pw-mod='pw-mod --gpg-args "-esr aidan@loughran.dev"'

# Sneaky function that commits with a specific date
git-commit-date() {
  GIT_COMMITTER_DATE="$1" git commit --date "$1" "${@:2}"
}

# Sneaky function that amends a commit with the same date
git-commit-amend() {
  GIT_COMMITTER_DATE="$(git log -1 --format=%cd)" git commit --amend --date "$(git log -1 --format=%cd)" "$@"
}
