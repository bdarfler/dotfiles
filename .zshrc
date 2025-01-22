# ================ Config ==================================

bindkey -e                                             # Use emacs movement bindings
bindkey "^[[1;3C" forward-word                         # Option Forward Arrow
bindkey "^[[1;3D" backward-word                        # Option Back Arrow
setopt globdots                                        # match files starting with .

export EDITOR=vim                                      # Vim
export VISUAL=vim                                      # Vim
export PAGER=less                                      # Less
export GPG_TTY=$(tty)                                  # GPG
export PATH=$HOME/.dotfiles/bin:$PATH                  # Add my binaries

source ~/.config/base16-shell/scripts/base16-gruvbox-dark-medium.sh

# ================ Homebrew ================================

eval "$(starship init zsh)"                            # Cross-Shell Prompt
eval "$(zoxide init zsh)"                              # A smarter cd command
HOMEBREW_PREFIX="$(brew --prefix)"                     # Homebrew prefix
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"         # Setup homebrew paths
source ${HOMEBREW_PREFIX}/share/antigen/antigen.zsh    # Plugin manager for zsh

# Setup fzf
if [[ ! "$PATH" == *${HOMEBREW_PREFIX}/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOMEBREW_PREFIX}/opt/fzf/bin"
fi
source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.zsh"
source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"

# https://docs.brew.sh/Shell-Completion
fpath=(${HOMEBREW_PREFIX}/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

# ================ Antigen =================================

export ADOTDIR=~/.antigen                              # Explict default value for Topgrade

antigen bundle zsh-users/zsh-autosuggestions           # Autosuggestions
antigen bundle gezalore/zsh-prioritize-cwd-history     # Prioritize history based on current dir
antigen bundle MichaelAquilina/zsh-history-filter      # Exclude commands from history based on patterns
antigen bundle Aloxaf/fzf-tab                          # Fuzzy tab completion
antigen apply

bindkey '^[[Z' autosuggest-accept                      # shift-tab to accept autosuggestion
bindkey '\t' fzf-tab-complete                          # tab to complete

# ================ History =================================

export HISTFILE=~/.zsh_history                         # Set history file location
export HISTSIZE=10000                                  # More history in memory
export SAVEHIST=10000                                  # More history on disk
export HISTORY_FILTER_EXCLUDE=("http://" "https://")   # Ignore commands with urls
setopt INC_APPEND_HISTORY                              # Append history incrementally
setopt HIST_IGNORE_ALL_DUPS                            # Ignore all duplicates

# ================ asdf ====================================

source ${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh             # Manage multiple runtime versions

# setup asdf for node
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_available

# setup pnpm
export PNPM_HOME="/Users/bendarfler/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# ================ Hub =====================================

# Delete Git's official completions to allow Zsh's official Git completions to work.
# This is also necessary for hub's Zsh completions to work:
# https://github.com/github/hub/issues/1956
[ -f ${HOMEBREW_PREFIX}/share/zsh/site-functions/_git ] && rm ${HOMEBREW_PREFIX}/share/zsh/site-functions/_git

# ================ Aliases =================================

alias podget='noglob yt-dlp --restrict-filenames \
  --extract-audio --audio-format "mp3" --audio-quality "9" \
  --add-metadata --output "~/Dropbox/Podcast/%(title)s.%(ext)s" "$@"'

alias kget='cp -i /Volumes/Kindle/documents/My\ Clippings.txt \
  ~/Dropbox/0\ Inbox/My\ Clippings\ `date +%m-%d`.md && \
  open ~/Dropbox/0\ Inbox/My\ Clippings\ `date +%m-%d`.md &&\
  osascript -e "tell application \"Finder\" to eject \"Kindle\""'

# ================ Better Versions =========================

alias git='hub'
alias cat='bat'
alias less='bat'
alias diff='delta'
alias find='fdfind'
alias top='htop'
alias ps='procs'
alias ls='eza'
alias grep='rg'
alias ping='prettyping --nolegend'
alias df='duf'
alias du='dust'

# ================ Local .zshrc ============================

[ -f ~/.zshrc.local ] && source ~/.zshrc.local


