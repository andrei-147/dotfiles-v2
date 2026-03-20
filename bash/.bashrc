#
# ~/.bashrc
#

zell-att() {
  if ! zellij attach 2>/dev/null; then
    zellij
  fi
}
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init bash)"

# Created by `pipx` on 2025-10-28 15:54:28
export PATH="$PATH:/home/andrei/dotfiles/scripts/.local/bin:/home/andrei/projects/devel/cpp/ezcompile:/home/andrei/projects/bin:/home/andrei/projects/lib:/home/andrei/projects/include"
