# Vim
export EDITOR=vim
export VISUAL=vim

# Colors
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
alias cat='ccat'
alias diff='colordiff'

# Local .bash_profile
if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi

# Liquidprompt
if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi

# Aliases
alias be='bundle exec'
alias ls='ls -al'

# Commands
alias clean_branches='git branch --merged | grep -v master | grep -v "*" | xargs git branch -d'
