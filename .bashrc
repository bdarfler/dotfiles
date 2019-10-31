# ================ go-jira =================================
# https://github.com/go-jira/go-jira

eval "$(jira --completion-script-bash)"

# ================ Hub =====================================
# https://hub.github.com/

if [ -x "$(command -v hub)" ]; then
  alias git=hub
fi

# ================ Git Prompt ==============================
# https://github.com/magicmonty/bash-git-prompt

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_THEME=Solarized_NoExitState
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# =================== fzf ==================================

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# ==================== z ===================================

if [ -f /usr/local/etc/profile.d/z.sh ]; then
  . /usr/local/etc/profile.d/z.sh
fi

# ================== fzf & z ===============================

# https://github.com/junegunn/fzf/wiki/examples#z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# ================ Bash Completion =========================

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# ================ Scripts =================================

export PATH=$HOME/.dotfiles/bin:$PATH

# ================ Docker ==================================

alias docker-stop='osascript -e "quit app \"Docker\""'

alias docker-start='open --background -a Docker && \
  while ! docker system info > /dev/null 2>&1; do sleep 1; done'

alias docker-restart='docker-stop && docker-start'

alias docker-nuke='docker system prune --all --volumes'

# ================ Docker Compose ==========================

# docker-compose alias with bash completion
alias dc=docker-compose
_completion_loader docker-compose
complete -F _docker_compose dc

# ================ General Config ==========================

export HISTSIZE=10000                                  # More history
shopt -s histappend                                    # Append history
shopt -s globstar                                      # ** globing
shopt -s nocaseglob                                    # Case-insensitive globbing
shopt -s nocasematch                                   # Case-insensitive matching
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

# ================ Visual Config ===========================

alias cat='bat'                                        # Colorize cat
alias diff='colordiff'                                 # Colorize diff
export CLICOLOR=1                                      # Colorize ls
export GREP_OPTIONS='--color=auto'                     # Colorize grep
export LESS='-RFX'                                     # Colorize and handle short files

# ================ Dedupe History ==========================
# http://superuser.com/a/410534
# http://unix.stackexchange.com/a/78846
# http://unix.stackexchange.com/a/114043

clean_hist () {
  tail -r ~/.bash_history | awk '!a[$0]++' | tail -r > .bash_history.tmp
  mv -f .bash_history.tmp ~/.bash_history
}

trap clean_hist EXIT

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
  chruby ruby-2.4.1
fi

# ================ pyenv ===================================
# https://github.com/pyenv/pyenv

eval "$(pyenv init -)"

# ================ nvm =====================================
# https://github.com/creationix/nvm

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# ================ Local .bashrc ===========================

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
