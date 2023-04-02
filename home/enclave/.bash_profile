[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  export GTK_THEME=Arc-Dark-solid
  exec startx
fi

export PATH=~/.npm-global/:bin:$PATH
