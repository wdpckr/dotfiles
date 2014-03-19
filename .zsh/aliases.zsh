ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
alias pu="pushd"
alias po="popd"
alias la="ls -lAh"
alias ll="ls -lh"
alias l="ls -lAh"
alias sl=ls
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias history="fc -il 1"
alias h="history"
alias rmkh="rm ~/.ssh/known_hosts"
alias grep="grep --color=auto"
#export GREP_COLOR='1;32'
