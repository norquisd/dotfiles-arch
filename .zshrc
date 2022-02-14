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
alias python='ipython'

export PATH=$PATH:/home/quinn/.local/bin
export MANPAGER="nvim -c 'set ft=man' -" 
export EDITOR="nvim" 

# line for node, use for lunarvim
# source /usr/share/nvm/init-nvm.sh
export PATH="$PATH:`yarn global bin`"

# NPM packages in homedir
NPM_PACKAGES="$HOME/.npm-packages"

# Tell our environment about user-installed node tools
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Tell Node about these packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# PROMPT='%F{white}[%f%F{red}%n%f%F{white}@%f%F{magenta}%m%f %F{cyan}%B%~%b%f%F{white}]%f$ '
PROMPT='%F{cyan}%n%f%F{white}@%f%F{white}%m%f %F{cyan}%B%~%b%f %% '
