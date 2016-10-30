# completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized_NoExitState
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# aliases
alias ls='ls -1A'

# commands
alias cleanbrs='git branch --merged | grep -v master | grep -v "*" | xargs git branch -d'
alias podcast='(cd ~/Dropbox/Public/Podcasting && ./generate.sh)'
alias brewup='brew update && brew upgrade && brew cleanup'

# colors
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
alias cat='ccat'
alias diff='colordiff'

# history
export HISTSIZE=100000
# unified, deduped history
# http://unix.stackexchange.com/a/18443
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# globstar
shopt -s globstar

# vim
export EDITOR=vim
export VISUAL=vim

# hub
if [ -x "$(command -v hub)" ]; then
  alias git=hub
fi

# gpg
GPG_TTY=$(tty)
export GPG_TTY

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

if [ -x "$(command -v jenv)" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# ruby
if [ -d /usr/local/opt/chruby ]; then
  source  /usr/local/opt/chruby/share/chruby/chruby.sh
  source  /usr/local/opt/chruby/share/chruby/auto.sh
  chruby ruby-2.3.1
fi

# local .bashrc
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
