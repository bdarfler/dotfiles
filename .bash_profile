# Bash completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized_NoExitState
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Aliases
alias be='bundle exec'
alias ls='ls -al'

# Commands
alias cleanbrs='git branch --merged | grep -v master | grep -v "*" | xargs git branch -d'
alias podcast='(cd ~/Dropbox/Public/Podcasting && ./generate.sh)'
alias brewup='brew update && brew upgrade && brew cleanup'

# Colors
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
alias cat='ccat'
alias diff='colordiff'

# Vim
export EDITOR=vim
export VISUAL=vim

# Hub
if [ -x "$(command -v hub)" ]; then
  alias git=hub
fi

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

if [ -x "$(command -v jenv)" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Ruby
if [ -d /usr/local/opt/chruby ]; then
  source  /usr/local/opt/chruby/share/chruby/chruby.sh
  source  /usr/local/opt/chruby/share/chruby/auto.sh
  chruby ruby-2.3.1
fi

# Local .bash_profile
if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi
