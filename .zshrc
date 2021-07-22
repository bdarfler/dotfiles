# ================ Bindings ================================

bindkey -e                                     # Use emacs movement bindings

# ================ Theme ===================================

source ~/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

# ================ Starship ================================

export STARSHIP_CONFIG=~/.starship/config.toml
eval "$(starship init zsh)"

# =================== fzf ==================================

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
source ~/.fzf.zsh

# =================== zoxide ===============================

eval "$(zoxide init zsh)"

# =================== asdf =================================

source /usr/local/opt/asdf/asdf.sh

# ================= Auto Completion ========================

fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# ================ Hub =====================================

# Delete Git's official completions to allow Zsh's official Git completions to work.
# This is also necessary for hub's Zsh completions to work:
# https://github.com/github/hub/issues/1956
[ -f /usr/local/share/zsh/site-functions/_git ] && rm /usr/local/share/zsh/site-functions/_git

# Workaround to map hub pr command to pull-request.
# https://github.com/github/hub/issues/1536
_gh () {
  if [ "pr" = "$1" ]; then hub pull-request; else hub "$@"; fi
}
compdef _hub _gh=hub
alias git=_gh

# ================ Auto Suggestions ========================

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="git *"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\t' forward-word                      # tab
bindkey '^[[Z' backward-word                   # shift-tab

# ================ Scripts =================================

export PATH=$HOME/.dotfiles/bin:$PATH

# ================ History =================================

export HISTFILE=~/.zsh_history                 # Set history file location
export HISTSIZE=10000                          # More history in memory
export SAVEHIST=10000                          # More history on disk

setopt INC_APPEND_HISTORY                      # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                    # Ignore all duplicates

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

# ================ Local .zshrc ============================

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
