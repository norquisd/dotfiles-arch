# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/quinn/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

alias ls='ls --color=auto'
alias grep='grep --color=auto -A 0'
alias lsblk='lsblk -e7'

export PATH=$PATH:/home/quinn/.local/bin
export MANPAGER="nvim -c 'set ft=man' -"

PROMPT='%F{white}[%f%F{blue}%n%f%F{white}@%f%F{213}%m%f %F{red}%B%~%b%f%F{white}]%f$ '
