" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Plugins ==========================

call plug#begin('~/.vim/bundle')

" Navigation Plugins
Plug 'justinmk/vim-dirvish'                                " Directory viewer for Vim
Plug 'Valloric/ListToggle'                                 " toggle the quickfix and location list
Plug 'sk1418/QFGrep'                                       " filter quickfix and location list results
Plug 'moll/vim-bbye'                                       " Close files without messing up your layout
Plug 'tpope/vim-unimpaired'                                " pairs of handy bracket mappings
Plug '/usr/local/opt/fzf'                                  " A command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                    " A command-line fuzzy finder

" Development Plugins
Plug 'ludovicchabant/vim-gutentags'                        " manages your tag files
Plug 'preservim/tagbar'                                    " displays tags in a window
Plug 'dense-analysis/ale'                                  " Asynchronous Lint Engine
Plug 'ervandew/supertab'                                   " use <Tab> for all your insert completion needs

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
Plug 'chriskempson/base16-vim'                             " An architecture for building themes
Plug 'vim-airline/vim-airline'                             " lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'                      " A collection of themes for vim-airline

" Language Plugins
Plug 'fatih/vim-go'                                        " Go development

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

if !has("gui_running")                                      " Compatible colors in shell
  let base16colorspace=256
endif

syntax enable                                              " Enable syntax coloring
set background=dark                                        " Enable dark background colors
colorscheme base16-gruvbox-dark-medium                     " Enable colorscheme

set updatetime=250                                         " Quicker updates
set signcolumn=yes                                         " Always show sign column

set guifont=FiraCode\ Nerd\ Font:h14                                  " Set Font
if has("gui_macvim")                                       " Enable ligutures in macvim
  set macligatures
endif

" ================ Plugins Config ====================

let g:airline#extensions#tabline#enabled = 1               " Show buffers when one tab is open
let g:airline_powerline_fonts = 1                          " Use powerline fonts in airline
let g:airline_theme='base16_gruvbox_dark_medium'           " Matching airline theme

let g:go_fmt_command = "goimports"                         " Run goimports on save

let g:lt_location_list_toggle_map = '<leader>ql'           " Toggle location
let g:lt_quickfix_list_toggle_map = '<leader>qq'           " Toggle quickfix

" ================ Custom Commands ===================

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
autocmd FileType go nmap gi <Plug>(go-info)
autocmd FileType go nmap gc <Plug>(go-callers)
autocmd FileType go nmap gs :GoFillStruct<CR>

" EasyAlign Mappings
xmap ea <Plug>(EasyAlign)
nmap ea <Plug>(EasyAlign)

" Leader Mappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <silent><Leader>r :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>x :Bdelete<CR>
nnoremap <silent> <leader>X :Bdelete!<CR>
nnoremap <silent> <leader>ws :StripWhitespace<CR> <bar> :w<CR>
nnoremap <silent> <leader>o :TagbarOpenAutoClose<CR>
nnoremap <silent> <leader>qp :pclose<CR>

" Remap for easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap for easier movement with wrapping
nnoremap j gj
nnoremap k gk
