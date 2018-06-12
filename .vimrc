" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Plugins ==========================

call plug#begin('~/.vim/bundle')

" Navigation Plugins
Plug 'mileszs/ack.vim'                                     " Vim plugin for the Perl module / CLI script 'ack'
Plug 'justinmk/vim-dirvish'                                " Directory viewer for Vim
Plug 'Valloric/ListToggle'                                 " toggle the quickfix and location list
Plug 'sk1418/QFGrep'                                       " filter quickfix and location list results
Plug 'moll/vim-bbye'                                       " Close files without messing up your layout
Plug 'tpope/vim-unimpaired'                                " pairs of handy bracket mappings
Plug '/usr/local/opt/fzf'                                  " A command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                    " A command-line fuzzy finder

" Development Plugins
Plug 'ludovicchabant/vim-gutentags'                        " manages your tag files
Plug 'majutsushi/tagbar'                                   " displays tags in a window
Plug 'w0rp/ale'                                            " Asynchronous Lint Engine
Plug 'ajh17/VimCompletesMe'                                " simple, minimal, light-weight tab completion
Plug 'rizzatti/dash.vim'                                   " Search Dash.app from Vim

" Git Plugins
Plug 'tpope/vim-fugitive'                                  " Better git integration
Plug 'tpope/vim-rhubarb'                                   " Needed for fugitive Gbrowse
Plug 'airblade/vim-gitgutter'                              " shows a git diff in the gutter

" Editor Plugins
Plug 'tpope/vim-sleuth'                                    " Heuristically set buffer options
Plug 'editorconfig/editorconfig-vim'                       " EditorConfig plugin for Vim
Plug 'ntpeters/vim-better-whitespace'                      " Better whitespace highlighting for Vim
Plug 'junegunn/vim-easy-align'                             " A Vim alignment plugin
Plug 'tpope/vim-commentary'                                " comment stuff out

" Visual Plugins
Plug 'altercation/vim-colors-solarized'                    " precision colorscheme for the vim text editor
Plug 'vim-airline/vim-airline'                             " lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'                      " A collection of themes for vim-airline

" Language Plugins
Plug 'fatih/vim-go'                                        " Go development
Plug 'ernstvanderlinden/vim-coldfusion'                    " ColdFusion Syntax Highlighter
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }        " Tern plugin for Vim
Plug 'pangloss/vim-javascript'                             " Vastly improved Javascript indentation and syntax
Plug 'mxw/vim-jsx'                                         " React JSX syntax highlighting and indenting

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
set smartindent                                            " Inserts one extra level of indentation in some cases
set expandtab                                              " <TAB> will insert 'softtabstop' amount of spaces
set shiftwidth=2                                           " Number of auto-indent spaces
set softtabstop=2                                          " Number of spaces per tab while editing
set tabstop=2                                              " Number of spaces per tab in a file

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

set updatetime=250                                         " Quicker updates
set signcolumn=yes                                         " Always show sign column

set guifont=Source\ Code\ Pro\ for\ Powerline:h16          " Set Font

" ================ Plugins Config ====================

let g:ale_javascript_eslint_executable = 'eslint_d'        " eslint_d for linting javascript
let g:ale_javascript_eslint_use_global = 1                 " eslint_d for linting javascript
let g:ale_fixers = { 'javascript': ['eslint'] }            " Enable eslint fixing
let g:ale_fix_on_save = 1                                  " Fix on save

let g:tern_map_keys = 1                                    " Enable tern mappings
let g:tern_map_prefix = '<Leader>'                         " Set tern mapping pefix to Leader

let g:airline#extensions#tabline#enabled = 1               " Show buffers when one tab is open
let g:airline_powerline_fonts = 1                          " Use powerline fonts in airline

let g:go_fmt_command = "goimports"                         " Run goimports on save

" Use rg for ack.vim
let g:ackprg = "rg --smart-case ---vimgrep --no-heading --hidden --glob '!.git'"

" ================ Custom Commands ===================

" ColdFusion Support
autocmd Bufread,BufNewFile *.cfm set filetype=eoz
autocmd Bufread,BufNewFile *.cfc set filetype=eoz

" Automatically resize splits when resizing window
autocmd VimResized * wincmd =

" Spelling and wrapping for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" Spelling for markdown
autocmd Filetype markdown setlocal spell

" Simple completion for markdown
autocmd FileType markdown inoremap <tab> <C-n>
autocmd FileType markdown inoremap <s-tab> <C-p>

" ================ Custom Mappings ===================

" Set leader to space
let mapleader = " "

" vim-go Mappings
autocmd FileType go nmap gr <Plug>(go-rename)
autocmd FileType go nmap ga <Plug>(go-alternate-edit)
autocmd FileType go nmap gi <Plug>(go-info)
autocmd FileType go nmap gc <Plug>(go-callers)

" EasyAlign Mappings
xmap ea <Plug>(EasyAlign)
nmap ea <Plug>(EasyAlign)

" Leader Mappings
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Ack!<Space>
nmap <silent> <leader>d <Plug>DashSearch
nnoremap <silent> <leader>x :Bdelete<CR>
nnoremap <silent> <leader>ws :StripWhitespace<CR> <bar> :w<CR>
nnoremap <silent> <leader>o :TagbarOpenAutoClose<CR>
nnoremap <silent> <leader>s :pclose<CR>

" Remap for easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap for easier movement with wrapping
nnoremap j gj
nnoremap k gk
