" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Vundle Plugins ===================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Vundle, the plug-in manager for Vim
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder.  
Plugin 'rking/ag.vim'                       " Vim plugin for the_silver_searcher, 'ag'
Plugin 'derekwyatt/vim-scala'               " Scala syntax highlighting
Plugin 'altercation/vim-colors-solarized'   " precision colorscheme for the vim text editor
Plugin 'tpope/vim-surround'                 " quoting/parenthesizing made simple

call vundle#end()
filetype plugin indent on

" ================ General Config ===================

set backspace=indent,eol,start  " Allow backspace in insert mode
set autoread                    " Reload files changed outside vim 
set history=1000                " Store lots of :cmdline history
set scrolloff=8                 " Scroll when 8 lines away from edge
set hidden                      " Leave hidden buffers open
set clipboard=unnamed           " Allow vim to use the system clipboard
set mouse=a                     " Enable mouse support

" ================ Visual Config =====================

set visualbell                  " Visual alerts, not sounds

set cursorline                  " Highlight the current line
set showmatch                   " Highlight matching braces
set colorcolumn=120             " Highlight column width guide

set number                      " Show line numbers  
set showcmd                     " Show incomplete cmds at the bottom
set showmode                    " Show current mode at the bottom
set ruler                       " Show column and line at the bottom

set splitbelow                  " Split below for horizontal splits
set splitright                  " Split right for vertica splits

syntax enable                   " Enable syntax coloring
set background=dark             " Enable dark background colors
colorscheme solarized           " Enable solarized colorscheme

" ================ Tab Completion ====================

set wildmenu                    " Better command-line completion
set wildmode=list:longest       " List matches, complete longest common string

" ================ Search ===========================

set incsearch                   " Find the next match as we type the search
set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Faster Search ====================
" https://robots.thoughtbot.com/faster-grepping-in-vim

set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

