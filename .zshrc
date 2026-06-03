# ================ Config ==================================

bindkey -e                                             # Use emacs movement bindings
bindkey "^[[1;3C" forward-word                         # Option Forward Arrow
bindkey "^[[1;3D" backward-word                        # Option Back Arrow
setopt globdots                                        # match files starting with .

export EDITOR=nvim                                     # Neovim
export VISUAL=nvim                                     # Neovim
export PAGER=less                                      # Less
export GPG_TTY=$(tty)                                  # GPG
export PATH=$HOME/.dotfiles/bin:$PATH                  # Add my binaries
export PATH="$HOME/.local/bin:$PATH"                   # For Claude
export PATH="$HOME/.cache/lm-studio/bin:$PATH"         # for LM Studio
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"       # for Rust

source ~/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

# ================ Homebrew ================================

eval "$(starship init zsh)"                            # Cross-Shell Prompt
eval "$(zoxide init zsh)"                              # A smarter cd command
eval "$(mise activate zsh)"                            # Tool version manager
eval "$(direnv hook zsh)"                              # auto-load .envrc in project dirs
HOMEBREW_PREFIX="$(brew --prefix)"                     # Homebrew prefix
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"         # Setup homebrew paths
source ${HOMEBREW_PREFIX}/opt/antidote/share/antidote/antidote.zsh  # Plugin manager for zsh

# Setup fzf
if [[ ! "$PATH" == *${HOMEBREW_PREFIX}/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOMEBREW_PREFIX}/opt/fzf/bin"
fi
source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh"
source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"

# https://docs.brew.sh/Shell-Completion
fpath=(${HOMEBREW_PREFIX}/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# ================ Antidote ================================

antidote load                                          # Loads plugins from ~/.zsh_plugins.txt

# Tab: accept autosuggestion if one is showing, otherwise fzf-tab completion
_tab_accept_or_fzf_tab() {
  if (( ${#POSTDISPLAY} )); then
    zle autosuggest-accept
  else
    zle fzf-tab-complete
  fi
}
zle -N _tab_accept_or_fzf_tab
bindkey '\t' _tab_accept_or_fzf_tab                    # tab: accept suggestion, else fzf-tab
bindkey '^[[Z' fzf-tab-complete                        # shift-tab: always fzf-tab

# ================ History =================================

export HISTFILE=~/.zsh_history                         # Set history file location
export HISTSIZE=10000                                  # More history in memory
export SAVEHIST=10000                                  # More history on disk
export HISTORY_FILTER_EXCLUDE=("http://" "https://")   # Ignore commands with urls
setopt INC_APPEND_HISTORY                              # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                            # Ignore all duplicates

# ================ Hub =====================================

# Delete Git's official completions to allow Zsh's official Git completions to work.
# This is also necessary for hub's Zsh completions to work:
# https://github.com/github/hub/issues/1956
[ -f ${HOMEBREW_PREFIX}/share/zsh/site-functions/_git ] && rm ${HOMEBREW_PREFIX}/share/zsh/site-functions/_git

# ================ Aliases =================================

alias podget='noglob yt-dlp --restrict-filenames \
  --extract-audio --audio-format "mp3" --audio-quality "9" \
  --add-metadata --output "~/Dropbox/Podcast/%(title)s.%(ext)s" "$@"'

# ================ Better Versions =========================

alias git='hub'
alias cat='bat'
alias less='bat'
alias diff='delta'
alias find='fd'
alias top='htop'
alias ps='procs'
alias ls='eza'
alias grep='rg'
alias ping='prettyping --nolegend'
alias df='duf'
alias du='dust'

# ================ Local .zshrc ============================

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
