# ================ Homebrew ================================

eval "$(starship init zsh)"                            # Cross-Shell Prompt
eval "$(zoxide init zsh)"                              # A smarter cd command
source /usr/local/opt/asdf/asdf.sh                     # Manage multiple runtime versions
source ~/.fzf.zsh                                      # Command-line fuzzy finder
source /usr/local/share/antigen/antigen.zsh            # Plugin manager for zsh

# https://docs.brew.sh/Shell-Completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# ================ Antigen =================================

antigen bundle zsh-users/zsh-autosuggestions           # Autosuggestions
antigen bundle gezalore/zsh-prioritize-cwd-history     # Prioritize history based on current dir
antigen bundle Aloxaf/fzf-tab                          # Fuzzy tab completion
antigen apply

# ================ Config ==================================

bindkey -e                                             # Use emacs movement bindings
bindkey '^[[Z' autosuggest-accept                      # shift-tab to accept autosuggestion
export PATH=$HOME/.dotfiles/bin:$PATH                  # Adds my binaries
alias brewup='brew update && brew upgrade && brew cleanup'
source ~/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

# ================ History =================================

export HISTFILE=~/.zsh_history                         # Set history file location
export HISTSIZE=10000                                  # More history in memory
export SAVEHIST=10000                                  # More history on disk
setopt INC_APPEND_HISTORY                              # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                            # Ignore all duplicates

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
