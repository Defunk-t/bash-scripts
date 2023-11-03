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

##############
# NPM Secure #
##############

# To protect from supply chain attacks always run NPM commands as another user.
# My user is granted permission to do this in the sudoers file.
alias npm='sudo -u npm npm'

# YT-DLP
alias yt-dlp='yt-dlp --cookies-from-browser firefox --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/119.0" -o "/mnt/nas/tmp/%(upload_date)s_%(title)s_%(id)s.%(ext)s"'
