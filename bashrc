#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm/node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.spicetifybash:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

fastfetch
