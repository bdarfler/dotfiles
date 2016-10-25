export EDITOR=vim
export VISUAL=vim
export CLICOLOR=1;
export GREP_OPTIONS='--color=auto'

if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi

if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi

alias be='bundle exec'
alias clean_branches='git branch --merged | grep -v master | grep -v "*" | xargs git branch -d'
alias ls='ls -al'

alias cat='ccat'
alias diff='colordiff'
