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

# =================== zoxide================================

eval "$(zoxide init bash)"

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
export JAVA_HOME=$(/usr/libexec/java_home -v 11)       # Java
export PYENV_ROOT="$HOME/.pyenv"                       # Python
export PATH="$PYENV_ROOT/bin:$PATH"                    # Python
export GOPATH=$HOME/go                                 # Go
export GOROOT=/usr/local/opt/go/libexec                # Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin              # Go
export PATH=/usr/local/sbin:$PATH                      # Homebrew

# Follow Physical Directory Structure
set -o physical

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

# ================ rbenv ===================================
# https://github.com/rbenv/rbenv

if [ -x "$(command -v rbenv)" ]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  eval "$(rbenv init -)"
fi

# ================ pyenv ===================================
# https://github.com/pyenv/pyenv

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# ================ nodenv ==================================
# https://github.com/nodenv/nodenv

if [ -x "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi

# ================ nodenv ==================================
# https://github.com/syndbg/goenv

if [ -x "$(command -v goenv)" ]; then
  eval "$(goenv init -)"
fi

# ================ Better Versions =========================

alias cat='bat'
alias less='bat'
alias diff='delta'
alias find='fdfind'
alias top='htop'
alias ps='procs'
alias ls='exa'
alias grep='rg'
alias ping='prettyping --nolegend'
alias df='duf'
alias du='dust'

# ================ Local .bashrc ===========================

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
