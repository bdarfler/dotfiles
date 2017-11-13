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

# ================ Scripts =================================

export PATH=$HOME/.dotfiles/bin:$PATH

# ================ Commands ================================

alias camfix='sudo killall VDCAssistant; sudo killall AppleCameraAssistant'
alias dc='docker-compose'

# ================ General Config ==========================

export HISTSIZE=10000                                  # More history
shopt -s histappend                                    # Append history
shopt -s globstar                                      # ** globing
export EDITOR=vim                                      # Vim
export VISUAL=vim                                      # Vim
export PAGER=less                                      # Less
export GPG_TTY=$(tty)                                  # GPG
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)      # Java
export GOPATH=$HOME/go                                 # Go
export GOROOT=/usr/local/opt/go/libexec                # Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin              # Go
export PATH=/usr/local/sbin:$PATH                      # Homebrew

# Follow Physical Directory Structure
set -o physical

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

# ================ Visual Config ===========================

alias cat='ccat'                                       # Colorize cat
alias diff='colordiff'                                 # Colorize diff
export CLICOLOR=1                                      # Colorize ls
export GREP_OPTIONS='--color=auto'                     # Colorize grep
export LESS='-RFX'                                     # Colorize and handle short files
export HH_CONFIG=hicolor                               # Colorize hh

# ================ Dedupe History ==========================
# http://superuser.com/a/410534
# http://unix.stackexchange.com/a/78846
# http://unix.stackexchange.com/a/114043

clean_hist () {
  tail -r ~/.bash_history | awk '!a[$0]++' | tail -r > .bash_history.tmp
  mv -f .bash_history.tmp ~/.bash_history
}

trap clean_hist EXIT

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
  chruby ruby-2.4.0
fi

# ================ pyenv ===================================
# https://github.com/pyenv/pyenv

eval "$(pyenv init -)"

# ================ Local .bashrc ===========================

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
