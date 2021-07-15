# ================ Starship ================================

export STARSHIP_CONFIG=~/.starship/config.toml
eval "$(starship init zsh)"

# =================== fzf ==================================

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =================== zoxide ===============================

eval "$(zoxide init zsh)"

# =================== asdf =================================

source /usr/local/opt/asdf/asdf.sh

# ================= Auto Completion ========================

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ================ Auto Suggestions ========================

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=074'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ================ Scripts =================================

export PATH=$HOME/.dotfiles/bin:$PATH

# ================ Binding =================================

bindkey -e                                         # Use emacs movement bindings
bindkey '\t' autosuggest-accept                    # Use tab to accept autosuggest

# ================ History =================================

export HISTFILE=~/.zsh_history                     # Set history file location
export HISTSIZE=10000                              # More history in memory
export SAVEHIST=10000                              # More history on disk

setopt INC_APPEND_HISTORY                          # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                        # Ignore all duplicates

# ================ Better Versions =========================

alias git='hub'
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
