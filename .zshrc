# ================ Starship ================================

export STARSHIP_CONFIG=~/.starship/config.toml
eval "$(starship init zsh)"

# =================== fzf ==================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# =================== zoxide ===============================

eval "$(zoxide init zsh)"

# =================== asdf =================================

source $(brew --prefix asdf)/asdf.sh

# ================= zsh Completion =========================

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ================ Scripts =================================

export PATH=$HOME/.dotfiles/bin:$PATH

# ================ Docker ==================================

alias docker-stop='osascript -e "quit app \"Docker\""'

alias docker-start='open --background -a Docker && \
  while ! docker system info > /dev/null 2>&1; do sleep 1; done'

alias docker-restart='docker-stop && docker-start'

alias docker-nuke='docker system prune --all --volumes'

# ================ Dedupe History ==========================
# http://superuser.com/a/410534
# http://unix.stackexchange.com/a/78846
# http://unix.stackexchange.com/a/114043

clean_hist () {
  tail -r ~/.zsh_history | awk '!a[$0]++' | tail -r > .zsh_history.tmp
  mv -f .zsh_history.tmp ~/.zsh_history
}

trap clean_hist EXIT

# ================ Better Versions =========================

alias git=hub
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

# ================= Local .zshrc ===========================

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
