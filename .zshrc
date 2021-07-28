# ================ Config ==================================

bindkey -e                                     # Use emacs movement bindings
export PATH=$HOME/.dotfiles/bin:$PATH          # Adds my binaries

bindkey '^[[Z' forward-word                    # shift-tab for partial autosuggest completion
export WORDCHARS=${WORDCHARS/\/}               # partial autosuggest completion stops at slashes

export HISTFILE=~/.zsh_history                 # Set history file location
export HISTSIZE=10000                          # More history in memory
export SAVEHIST=10000                          # More history on disk
setopt INC_APPEND_HISTORY                      # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                    # Ignore all duplicates

source ~/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

# ================ Plugins ================================

eval "$(starship init zsh)"                    # Cross-Shell Prompt
eval "$(zoxide init zsh)"                      # A smarter cd command
source /usr/local/opt/asdf/asdf.sh             # Manage multiple runtime versions
source ~/.fzf.zsh                              # Command-line fuzzy finder

# Homebrew shell completions: https://docs.brew.sh/Shell-Completion
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# Antigen Plugin Manager
source /usr/local/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Aloxaf/fzf-tab
antigen bundle gezalore/zsh-prioritize-cwd-history
antigen apply

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

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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

# ================ Aliases =================================

alias brewup='brew update && brew upgrade && brew cleanup'
alias gdon='for i in /Volumes/GoogleDrive*; do mdutil $i -i on; done'
alias gdoff='for i in /Volumes/GoogleDrive*; do mdutil $i -i off; done'
alias gdst='for i in /Volumes/GoogleDrive*; do mdutil $i -s; done'

# ================ Local .zshrc ============================

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
