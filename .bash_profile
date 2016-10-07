export EDITOR=vim
export VISUAL=vim
export CLICOLOR=1;
export GREP_OPTIONS='--color=auto'

if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi

alias be='bundle exec'
alias clean_branches='git branch --merged | grep -v master | grep -v "*" | xargs git branch -d'
alias diff='colordiff'
alias ls='ls -al'
