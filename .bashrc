# ================ Bash Completion =========================

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# ================ Git Prompt ==============================
# https://github.com/magicmonty/bash-git-prompt

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized_NoExitState
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# ================ Aliases =================================

alias ls='ls -1A'                         # one file per line, show hidden files

# ================ Commands ================================

alias cleanbrs='git branch --merged | grep -v master | grep -v "*" | xargs git branch -d' # Delete Merged Branches
alias podcast='(cd ~/Dropbox/Public/Podcasting && ./generate.sh)'                         # Generate Podcast RSS Feed
alias brewup='brew update && brew upgrade && brew cleanup'                                # Update Homebrew

# ================ General Config ==========================

export HISTSIZE=100000                            # More History
shopt -s globstar                                 # ** globing

export EDITOR=vim                                 # Use Vim
export VISUAL=vim                                 # Use Vim

export GPG_TTY=$(tty)                             # GPG Setup
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # Java 8

# ================ Visual Config ===========================

export CLICOLOR=1                                 # Colorize ls
export GREP_OPTIONS='--color=auto'                # Colorize grep

alias cat='ccat'                                  # Colorize cat
alias diff='colordiff'                            # Colorize diff

# ================ Unified, Deduped History ================
# http://unix.stackexchange.com/a/18443

shopt -s histappend
export HISTCONTROL=ignoredups:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# ================ Hub =====================================
# https://hub.github.com/

if [ -x "$(command -v hub)" ]; then
  alias git=hub
fi

# ================ jEnv ====================================
# http://www.jenv.be/

if [ -x "$(command -v jenv)" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# ================ chruby ==================================
# https://github.com/postmodern/chruby

if [ -d /usr/local/opt/chruby ]; then
  source  /usr/local/opt/chruby/share/chruby/chruby.sh
  source  /usr/local/opt/chruby/share/chruby/auto.sh
  chruby ruby-2.3.1
fi

# ================ Local .bashrc ===========================

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
