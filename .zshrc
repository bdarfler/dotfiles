# ================ Config ==================================

bindkey -e                                     # Use emacs movement bindings
export PATH=$HOME/.dotfiles/bin:$PATH          # Adds my binaries

# ================ Theme ===================================

source ~/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

# ================ Starship ================================

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
zmodload zsh/complist

# agressivly enable the completion menu
zstyle ':completion:*' menu yes select
# color the completion menu
zstyle ':completion:*' list-colors “${(s.:.)LS_COLORS}”
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# completes hidden files
setopt globdots

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
bindkey '^[[Z' forward-word                    # shift-tab
export WORDCHARS=${WORDCHARS/\/}               # tab to slashes

# ================ History =================================

export HISTFILE=~/.zsh_history                 # Set history file location
export HISTSIZE=10000                          # More history in memory
export SAVEHIST=10000                          # More history on disk

setopt INC_APPEND_HISTORY                      # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                    # Ignore all duplicates

source ~/.zsh/zsh-prioritize-cwd-history/zsh-prioritize-cwd-history.zsh

# ================ Aliases =================================

alias brewup='brew update && brew upgrade && brew cleanup'
alias gdon='for i in /Volumes/GoogleDrive*; do mdutil $i -i on; done'
alias gdoff='for i in /Volumes/GoogleDrive*; do mdutil $i -i off; done'
alias gdst='for i in /Volumes/GoogleDrive*; do mdutil $i -s; done'

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
