" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Vundle Plugins ===================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Vundle, the plug-in manager for Vim
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'mileszs/ack.vim'                    " Vim plugin for the Perl module / CLI script 'ack'
Plugin 'derekwyatt/vim-scala'               " Scala syntax highlighting
Plugin 'altercation/vim-colors-solarized'   " precision colorscheme for the vim text editor
Plugin 'tpope/vim-surround'                 " quoting/parenthesizing made simple
Plugin 'ntpeters/vim-better-whitespace'     " highlight all trailing whitespace characters
Plugin 'vim-airline/vim-airline'            " lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " A collection of themes for vim-airline
Plugin 'airblade/vim-gitgutter'             " shows a git diff in the gutter
Plugin 'godlygeek/tabular'                  " vertical alignment
Plugin 'tpope/vim-commentary'               " comment stuff out
Plugin 'yggdroot/indentline'                " display the indention levels with thin vertical lines
Plugin 'tpope/vim-endwise'                  " wisely add 'end' in ruby
Plugin 'scrooloose/nerdtree'                " A tree explorer plugin for vim

call vundle#end()
filetype plugin indent on

" ================ General Config ===================

set autoread                                " Reload files changed outside vim
set history=1000                            " Store lots of :cmdline history
set hidden                                  " Leave hidden buffers open
set clipboard=unnamed                       " Allow vim to use the system clipboard
set mouse=a                                 " Enable mouse support

set nobackup                                " no backup files
set nowritebackup                           " no backup file while editing
set noswapfile                              " no swap files

set wildmenu                                " Better command-line completion
set wildmode=list:longest                   " List matches, complete longest common string

set incsearch                               " Find the next match as we type the search
set hlsearch                                " Highlight searches by default
set ignorecase                              " Ignore case when searching...
set smartcase                               " ...unless we type a capital

set grepprg=ag\ --nogroup\ --nocolor        " Use ag for grepping

" ================ Visual Config =====================

set visualbell                              " Visual alerts, not sounds

set cursorline                              " Highlight the current line
set showmatch                               " Highlight matching braces
set colorcolumn=120                         " Highlight column width guide

set number                                  " Show line numbers
set relativenumber                          " Show relative line numbers

set splitbelow                              " Split below for horizontal splits
set splitright                              " Split right for vertica splits

set showcmd                                 " Show incomplete cmds at the bottom
set ruler                                   " Show column and line at the bottom
set laststatus=2                            " Show status line
set noshowmode                              " Hide current mode at the bottom

syntax enable                               " Enable syntax coloring
set background=dark                         " Enable dark background colors
colorscheme solarized                       " Enable solarized colorscheme

set guifont=Source\ Code\ Pro\ for\ Powerline:h14    " Set Font

" ================ Editor Config =====================

set backspace=2                             " Allow backspace in insert mode
set scrolloff=8                             " Scroll when 8 lines away from edge

set autoindent                              " Copy indent from current line when starting a new line
set smartindent                             " Enable smart indent
set smarttab                                " Enable smart tabs
set shiftwidth=2                            " Number of auto-indent spaces
set softtabstop=2                           " Number of spaces per tab while editing
set tabstop=2                               " Number of spaces per tab in a file
set expandtab                               " Use spaces instead of tabs

" ================ Plugins Config ====================

let g:ackprg = 'ag --vimgrep'               " Uss ag instead of ack for ack.vim
let g:airline_powerline_fonts = 1           " Use powerline fonts in airline
let g:NERDTreeShowHidden=1                  " Show Hiddent Files in NERDTree
let g:ctrlp_use_caching = 0                 " Disable caching for ctrlp

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

" ================ Custom Mapings ====================

" Set leader to space
let mapleader = " "

" Mappings for Plugins
nnoremap <leader>a :Ack<Space>
nnoremap <leader>t :Tabularize<Space>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>ws :StripWhitespace<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

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
