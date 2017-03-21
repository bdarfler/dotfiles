" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Vundle Plugins ===================

call plug#begin('~/.vim/bundle')

Plug 'ctrlpvim/ctrlp.vim'                                  " Fuzzy file, buffer, mru, tag, etc finder
Plug 'JazzCore/ctrlp-cmatcher'                             " Better fuzzy finding
Plug 'vim-syntastic/syntastic'                             " Syntax checking hacks for vim
Plug 'altercation/vim-colors-solarized'                    " precision colorscheme for the vim text editor
Plug 'vim-airline/vim-airline'                             " lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'                      " A collection of themes for vim-airline
Plug 'mileszs/ack.vim'                                     " Vim plugin for the Perl module / CLI script 'ack'
Plug 'ntpeters/vim-better-whitespace'                      " Better whitespace highlighting for Vim
Plug 'airblade/vim-gitgutter'                              " shows a git diff in the gutter
Plug 'junegunn/vim-easy-align'                              " A Vim alignment plugin
Plug 'milkypostman/vim-togglelist'                         " toggle location and quickfix windows
Plug 'ajh17/VimCompletesMe'                                " simple, minimal, light-weight tab completion
Plug 'tpope/vim-commentary'                                " comment stuff out
Plug 'derekwyatt/vim-scala'                                " Scala syntax highlighting
Plug 'fatih/vim-go'                                        " Go development
Plug 'ernstvanderlinden/vim-coldfusion'                    " ColdFusion Syntax Highlighter

call plug#end()

" ================ General Config ===================

set autoread                                               " Reload files changed outside vim
set history=1000                                           " Store lots of :cmdline history
set hidden                                                 " Leave hidden buffers open
set clipboard=unnamed                                      " Allow vim to use the system clipboard
set spelllang=en_us                                        " Set spelling for US English

set nobackup                                               " no backup files
set nowritebackup                                          " no backup file while editing
set noswapfile                                             " no swap files

set wildmenu                                               " Better command-line completion
set wildmode=list:longest                                  " List matches, complete longest common string

set incsearch                                              " Find the next match as we type the search
set hlsearch                                               " Highlight searches by default
set ignorecase                                             " Ignore case when searching...
set smartcase                                              " ...unless we type a capital

set backspace=2                                            " Allow backspace in insert mode
set scrolloff=8                                            " Scroll when 8 lines away from edge

set autoindent                                             " Copy indent from current line when starting a new line
set smartindent                                            " Enable smart indent
set smarttab                                               " Enable smart tabs
set shiftwidth=2                                           " Number of auto-indent spaces
set softtabstop=2                                          " Number of spaces per tab while editing
set tabstop=2                                              " Number of spaces per tab in a file
set expandtab                                              " Use spaces instead of tabs

" Use rg for grepping
set grepprg=rg\ --smart-case\ --vimgrep\ --no-heading\ --hidden\ --glob\ '!.git'

" ================ Visual Config =====================

set visualbell                                             " Visual alerts, not sounds
set showbreak=↪                                            " Visually distinguish wrapped lines

set cursorline                                             " Highlight the current line
set showmatch                                              " Highlight matching braces
set colorcolumn=120                                        " Highlight column width guide

set number                                                 " Show line numbers

set splitbelow                                             " Split below for horizontal splits
set splitright                                             " Split right for vertical splits

set showcmd                                                " Show incomplete cmds at the bottom
set ruler                                                  " Show column and line at the bottom
set laststatus=2                                           " Show status line
set noshowmode                                             " Hide current mode at the bottom

syntax enable                                              " Enable syntax coloring
set background=dark                                        " Enable dark background colors
colorscheme solarized                                      " Enable solarized colorscheme

set guifont=Source\ Code\ Pro\ for\ Powerline:h14          " Set Font

" ================ netrw Config ======================

let g:netrw_banner          = 0                            " Disable banner information
let g:netrw_mousemaps       = 0                            " Disable mouse maps
let g:netrw_liststyle       = 3                            " Tree style listing
let g:netrw_winsize         = -30                          " Set absolute window size

" an unscientific attempt to prevent zombie
" buffers that netrw occasionally creates
let g:netrw_menu            = 0                            " Disable the menu
let g:netrw_use_errorwindow = 0                            " Do not use an error window
let g:netrw_fastbrowse      = 2                            " Do not refresh dir listings
let g:netrw_dirhistmax      = 0                            " Disable dir history

" ================ Plugins Config ====================

let g:syntastic_always_populate_loc_list = 1               " Fill in location list with errors
let g:syntastic_auto_loc_list = 1                          " Auto open location list if errors exist
let g:syntastic_check_on_open = 1                          " Run checks when files are opened

let g:airline#extensions#tabline#enabled = 1               " Show buffers when one tab is open
let g:airline_powerline_fonts            = 1               " Use powerline fonts in airline

let g:ctrlp_match_func   = { 'match' : 'matcher#cmatch' }  " Use better matching function for ctrlp
let g:ctrlp_use_caching  = 0                               " Disable caching for ctrlp

" Use rg cmd for ctrlp
let g:ctrlp_user_command = "rg --files --hidden --glob '!.git' %s"

" Use rg for ack.vim
let g:ackprg = "rg --smart-case ---vimgrep --no-heading --hidden --glob '!.git'"

" ColdFusion Syntax Highlighting
autocmd Bufread,BufNewFile *.cfm set filetype=eoz
autocmd Bufread,BufNewFile *.cfc set filetype=eoz

" ================ Custom Commands ===================

" Open On Launch
autocmd VimEnter * :Lexplore                               " Open netrw
autocmd VimEnter * wincmd p                                " Move to center panel

" Spelling and wrapping for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" ================ Custom Mappings ===================

" Set leader to space
let mapleader = " "

" Leader Mappings
nnoremap <leader>ws :StripWhitespace<CR>
nnoremap <leader>d :diffget<Space>
nnoremap <leader>a :Ack<Space>
nnoremap <leader>t :Lexplore<CR>

" Disable Arrow Keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>

inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>

" Remap for easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" The good parts of tpope/unimparied
nnoremap <silent> [a :previous<CR>
nnoremap <silent> ]a :next<CR>
nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>

nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>
